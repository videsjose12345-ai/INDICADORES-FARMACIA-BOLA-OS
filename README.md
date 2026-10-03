# Dashboard de indicadores — Farmacia Bolaños

Sitio estático publicado en Vercel y conectado al proyecto privado `farmacia-bolanos-dashboard` de Supabase.

## Sincronización entre dispositivos

1. Abre el dashboard en tu computadora y crea una cuenta con tu correo y contraseña. Confirma el correo si Supabase lo solicita.
2. Inicia sesión en el dashboard desde la computadora para importar los registros que ya estuvieran guardados allí.
3. Abre el mismo enlace en tu teléfono e inicia sesión con la misma cuenta.

Cada cuenta solo puede leer y editar sus propios datos mediante Row Level Security. La aplicación usa una clave publicable del navegador; nunca uses una clave `secret` o `service_role` en el HTML.

Los datos existentes se importan del almacenamiento local al iniciar sesión si no existen aún en la nube. Cuando hay un registro de mismo mes o semana en Supabase, prevalece el de la nube.
