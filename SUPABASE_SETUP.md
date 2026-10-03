# Supabase del dashboard

Este dashboard está conectado al proyecto privado `farmacia-bolanos-dashboard`.

- Las tablas `monthly_indicators` y `weekly_debts` guardan ventas, compras, pagos a proveedores y saldos semanales de deuda.
- Row Level Security está activado; las políticas limitan el acceso a los registros de la cuenta autenticada.
- El cliente web utiliza solamente la clave publicable de Supabase. No publiques claves `secret` ni `service_role`.
- La URL de producción está configurada como Site URL y Redirect URL de Supabase Auth.
- `supabase_setup.sql` documenta el esquema y las políticas instaladas.

Al iniciar sesión, el dashboard combina datos remotos con registros locales que no existan todavía en la nube. Para sincronizar PC y teléfono, inicia sesión en ambos con la misma cuenta.
