# Demo de Eventos (vistas + datos base)

Este repositorio incluye scripts SQL para levantar una **base de datos demo** de eventos con datos iniciales y vistas listas para consultas.

## Archivos clave

- `demo_schema.sql`: crea la base `eventos_db` y las tablas `categorias`, `organizadores`, `eventos`.
- `demo_seed_and_views.sql`: inserta datos base y crea vistas para la demo.

## Cómo ejecutar

```bash
mysql -u root -p < demo_schema.sql
mysql -u root -p < demo_seed_and_views.sql
```

## Vistas disponibles

1. `vw_eventos_detalle`
   - Une eventos con categoría y organizador.
2. `vw_eventos_publicados`
   - Lista solo eventos en estado `publicado`.
3. `vw_resumen_categoria`
   - Totales y promedio de precio por categoría.

## Consultas rápidas

```sql
SELECT * FROM vw_eventos_publicados;
SELECT * FROM vw_eventos_detalle WHERE precio = 0;
SELECT * FROM vw_resumen_categoria;
```

## Nota

`index.html` muestra una vista estática con instrucciones rápidas para usar los scripts como demo.
