# Estructura base (Laravel + MySQL)

Este repositorio define una base para un proyecto en **Laravel** con **MySQL**, tomando como referencia tu solicitud y el video compartido.

## 1) Crear proyecto Laravel

```bash
composer create-project laravel/laravel eventos
cd eventos
```

## 2) Configurar base de datos MySQL (`.env`)

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=eventos_db
DB_USERNAME=root
DB_PASSWORD=secret
```

## 3) Estructura recomendada

- `app/Models`: modelos (por ejemplo `Evento`, `Categoria`, `Usuario`)
- `app/Http/Controllers`: controladores web/api
- `database/migrations`: definición de tablas y relaciones
- `database/seeders`: datos iniciales
- `routes/web.php`: rutas para vistas
- `routes/api.php`: rutas para API
- `resources/views`: vistas Blade

## 4) Modelo de ejemplo: eventos

Entidad principal sugerida:

- `id`
- `titulo`
- `descripcion`
- `fecha_inicio`
- `fecha_fin`
- `ubicacion`
- `cupo`
- `estado` (`borrador`, `publicado`, `cancelado`)
- `created_at`, `updated_at`

## 5) Flujo mínimo recomendado

1. Crear migración de `eventos`.
2. Crear modelo `Evento`.
3. Crear controlador resource `EventoController`.
4. Definir rutas resource.
5. Crear vistas Blade (`index`, `create`, `edit`, `show`).
6. Ejecutar migraciones:

```bash
php artisan migrate
```

## 6) Comandos útiles

```bash
php artisan make:model Evento -mcr
php artisan migrate
php artisan serve
```

## 7) Siguiente paso

Si quieres, en el siguiente paso te puedo dejar:

- migraciones completas,
- controladores CRUD,
- rutas,
- y vistas Blade listas para copiar/pegar.
