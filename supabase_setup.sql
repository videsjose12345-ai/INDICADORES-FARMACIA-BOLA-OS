create table if not exists public.monthly_indicators (
  user_id uuid not null references auth.users(id) on delete cascade,
  period text not null check (period ~ '^\d{4}-(0[1-9]|1[0-2])$'),
  sales numeric(14,2) not null check (sales >= 0),
  purchases numeric(14,2) not null check (purchases >= 0),
  payments numeric(14,2) not null check (payments >= 0),
  updated_at timestamptz not null default now(),
  primary key (user_id, period)
);
create table if not exists public.weekly_debts (
  user_id uuid not null references auth.users(id) on delete cascade,
  week_date date not null,
  debt numeric(14,2) not null check (debt >= 0),
  updated_at timestamptz not null default now(),
  primary key (user_id, week_date)
);
alter table public.monthly_indicators enable row level security;
alter table public.weekly_debts enable row level security;
revoke all on public.monthly_indicators from anon;
revoke all on public.weekly_debts from anon;
grant select, insert, update, delete on public.monthly_indicators to authenticated;
grant select, insert, update, delete on public.weekly_debts to authenticated;
create policy "Users manage their own monthly indicators" on public.monthly_indicators for all to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy "Users manage their own weekly debts" on public.weekly_debts for all to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

-- Totales diarios (ventas, compras, pagos) para la vista por rango de fechas
create table if not exists public.daily_indicators (
  user_id uuid not null references auth.users(id) on delete cascade,
  day date not null,
  sales numeric(14,2),
  purchases numeric(14,2),
  payments numeric(14,2),
  updated_at timestamptz not null default now(),
  primary key (user_id, day)
);
alter table public.daily_indicators enable row level security;
revoke all on public.daily_indicators from anon;
grant select, insert, update, delete on public.daily_indicators to authenticated;
create policy "Users manage their own daily indicators" on public.daily_indicators for all to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
