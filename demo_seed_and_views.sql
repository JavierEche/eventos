USE eventos_db;

-- Datos base
INSERT INTO categorias (nombre, descripcion) VALUES
('Tecnología', 'Charlas y talleres sobre software e innovación'),
('Marketing', 'Eventos de marketing digital y crecimiento'),
('Comunidad', 'Meetups y networking local');

INSERT INTO organizadores (nombre, email, telefono) VALUES
('Eventos Latam', 'contacto@eventoslatam.com', '+1-555-1000'),
('DevHub', 'hola@devhub.io', '+1-555-2000'),
('Growth Lab', 'equipo@growthlab.io', '+1-555-3000');

INSERT INTO eventos (categoria_id, organizador_id, titulo, descripcion, fecha_inicio, fecha_fin, ubicacion, cupo, precio, estado) VALUES
(1, 2, 'Laravel Day 2026', 'Conferencias y prácticas de Laravel para equipos de producto.', '2026-06-10 09:00:00', '2026-06-10 18:00:00', 'Centro Convenciones CDMX', 250, 99.00, 'publicado'),
(1, 2, 'Frontend & UX Summit', 'Buenas prácticas para construir experiencias modernas.', '2026-06-17 10:00:00', '2026-06-17 17:00:00', 'Monterrey Tech Hall', 180, 79.00, 'publicado'),
(2, 3, 'Growth Bootcamp', 'Taller práctico de adquisición, retención y analítica.', '2026-07-04 08:30:00', '2026-07-04 16:00:00', 'Bogotá Business Center', 120, 129.00, 'publicado'),
(3, 1, 'Meetup Comunidad Dev', 'Networking para desarrolladores y reclutadores.', '2026-05-22 19:00:00', '2026-05-22 21:00:00', 'Hub Startup Medellín', 90, 0.00, 'publicado'),
(3, 1, 'Foro de Voluntariado', 'Sesión de planeación para voluntarios de eventos.', '2026-05-15 18:00:00', '2026-05-15 20:00:00', 'Casa Cultural Norte', 60, 0.00, 'borrador');

-- Vistas para demo
CREATE OR REPLACE VIEW vw_eventos_detalle AS
SELECT
  e.id,
  e.titulo,
  e.descripcion,
  c.nombre AS categoria,
  o.nombre AS organizador,
  o.email AS organizador_email,
  e.fecha_inicio,
  e.fecha_fin,
  e.ubicacion,
  e.cupo,
  e.precio,
  e.estado
FROM eventos e
JOIN categorias c ON c.id = e.categoria_id
JOIN organizadores o ON o.id = e.organizador_id;

CREATE OR REPLACE VIEW vw_eventos_publicados AS
SELECT
  id,
  titulo,
  categoria,
  organizador,
  fecha_inicio,
  fecha_fin,
  ubicacion,
  precio
FROM vw_eventos_detalle
WHERE estado = 'publicado'
ORDER BY fecha_inicio ASC;

CREATE OR REPLACE VIEW vw_resumen_categoria AS
SELECT
  c.nombre AS categoria,
  COUNT(e.id) AS total_eventos,
  SUM(CASE WHEN e.estado = 'publicado' THEN 1 ELSE 0 END) AS publicados,
  AVG(e.precio) AS precio_promedio
FROM categorias c
LEFT JOIN eventos e ON e.categoria_id = c.id
GROUP BY c.nombre;
