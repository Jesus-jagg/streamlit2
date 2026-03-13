-- Estructura de tabla para la tabla `comunidades_energeticas`
CREATE TABLE comunidades_energeticas (
  id_comunidad INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL,
  descripcion TEXT DEFAULT NULL,
  ubicacion TEXT DEFAULT NULL,
  proyecto_asociado INTEGER,
  FOREIGN KEY (proyecto_asociado) REFERENCES proyectos(id_proyecto)
);

-- Volcado de datos para la tabla `comunidades_energeticas`
INSERT INTO comunidades_energeticas (id_comunidad, nombre, descripcion, ubicacion, proyecto_asociado) VALUES
(1, 'Comunidad Solar Andes', 'Comunidad que utiliza energía solar', 'Andes', 1),
(2, 'Comunidad Eólica La Guajira', 'Comunidad que utiliza energía eólica', 'La Guajira', 2),
(3, 'Comunidad Biomasa Cauca', 'Comunidad que utiliza energía de biomasa', 'Cauca', 4),
(4, 'Comunidad Geotérmica Nariño', 'Comunidad que utiliza energía geotérmica', 'Nariño', 5);

-- Estructura de tabla para la tabla `eficiencia_energetica`
CREATE TABLE eficiencia_energetica (
  id_eficiencia INTEGER PRIMARY KEY AUTOINCREMENT,
  proyecto_id INTEGER,
  tipo_energia_id INTEGER,
  fecha DATE DEFAULT NULL,
  kw_h_generado REAL DEFAULT NULL,
  costo_produccion REAL DEFAULT NULL,
  costo_comercializacion REAL DEFAULT NULL,
  tiempos_muertos INTEGER DEFAULT NULL,
  clima TEXT DEFAULT NULL,
  indicador_economico REAL DEFAULT NULL,
  indicador_sociodemografico REAL DEFAULT NULL,
  FOREIGN KEY (proyecto_id) REFERENCES proyectos(id_proyecto),
  FOREIGN KEY (tipo_energia_id) REFERENCES tipos_energia(id_tipo)
);

-- Volcado de datos para la tabla `eficiencia_energetica`
INSERT INTO eficiencia_energetica (id_eficiencia, proyecto_id, tipo_energia_id, fecha, kw_h_generado, costo_produccion, costo_comercializacion, tiempos_muertos, clima, indicador_economico, indicador_sociodemografico) VALUES
(1, 1, 3, '2022-01-01', 1500.00, 100000.00, 5000.00, 2, 'Soleado', 80.00, 70.00),
(2, 1, 3, '2022-01-02', 1520.00, 101000.00, 5100.00, 1, 'Soleado', 81.00, 71.00),
(3, 1, 3, '2022-01-03', 1480.00, 99000.00, 4900.00, 3, 'Nublado', 79.00, 69.00),
(4, 1, 3, '2022-01-04', 1510.00, 100500.00, 5050.00, 2, 'Soleado', 80.50, 70.50),
(5, 1, 3, '2022-01-05', 1490.00, 99500.00, 4975.00, 2, 'Nublado', 79.50, 69.50),
(6, 1, 3, '2022-01-06', 1505.00, 100250.00, 5025.00, 1, 'Soleado', 80.25, 70.25),
(7, 1, 3, '2022-01-07', 1515.00, 100750.00, 5075.00, 2, 'Nublado', 80.75, 70.75),
(8, 1, 3, '2022-01-08', 1525.00, 101250.00, 5125.00, 3, 'Soleado', 81.25, 71.25),
(9, 1, 3, '2022-01-09', 1485.00, 99250.00, 4950.00, 1, 'Nublado', 79.25, 69.25),
(10, 1, 3, '2022-01-10', 1475.00, 98750.00, 4925.00, 2, 'Soleado', 78.75, 68.75),
(11, 2, 2, '2021-06-01', 2000.00, 150000.00, 8000.00, 1, 'Ventoso', 85.00, 65.00),
(12, 2, 2, '2021-06-02', 2020.00, 151000.00, 8100.00, 0, 'Ventoso', 86.00, 66.00),
(13, 2, 2, '2021-06-03', 1980.00, 149000.00, 7900.00, 2, 'Lluvioso', 84.00, 64.00),
(14, 2, 2, '2021-06-04', 2010.00, 150500.00, 8050.00, 1, 'Ventoso', 85.50, 65.50),
(15, 2, 2, '2021-06-05', 1990.00, 149500.00, 7975.00, 1, 'Lluvioso', 84.50, 64.50),
(16, 2, 2, '2021-06-06', 2005.00, 150250.00, 8025.00, 0, 'Ventoso', 85.25, 65.25),
(17, 2, 2, '2021-06-07', 2015.00, 150750.00, 8075.00, 1, 'Ventoso', 85.75, 65.75),
(18, 2, 2, '2021-06-08', 2025.00, 151250.00, 8125.00, 2, 'Lluvioso', 86.25, 66.25),
(19, 2, 2, '2021-06-09', 1985.00, 149250.00, 7950.00, 0, 'Ventoso', 84.25, 64.25),
(20, 2, 2, '2021-06-10', 1975.00, 148750.00, 7925.00, 1, 'Ventoso', 83.75, 63.75),
(21, 3, 1, '2023-04-01', 1800.00, 120000.00, 6000.00, 3, 'Lluvioso', 75.00, 72.00),
(22, 3, 1, '2023-04-02', 1820.00, 121000.00, 6100.00, 2, 'Nublado', 76.00, 73.00),
(23, 3, 1, '2023-04-03', 1780.00, 119000.00, 5900.00, 4, 'Lluvioso', 74.00, 71.00),
(24, 3, 1, '2023-04-04', 1810.00, 120500.00, 6050.00, 3, 'Soleado', 75.50, 72.50),
(25, 3, 1, '2023-04-05', 1790.00, 119500.00, 5975.00, 3, 'Lluvioso', 74.50, 71.50),
(26, 3, 1, '2023-04-06', 1805.00, 120250.00, 6025.00, 2, 'Nublado', 75.25, 72.25),
(27, 3, 1, '2023-04-07', 1815.00, 120750.00, 6075.00, 3, 'Lluvioso', 75.75, 72.75),
(28, 3, 1, '2023-04-08', 1825.00, 121250.00, 6125.00, 4, 'Soleado', 76.25, 73.25),
(29, 3, 1, '2023-04-09', 1785.00, 119250.00, 5950.00, 2, 'Lluvioso', 74.25, 71.25),
(30, 3, 1, '2023-04-10', 1775.00, 118750.00, 5925.00, 3, 'Nublado', 73.75, 70.75),
(31, 4, 4, '2022-07-01', 1600.00, 110000.00, 7000.00, 0, 'Nublado', 78.00, 68.00),
(32, 4, 4, '2022-07-02', 1620.00, 111000.00, 7100.00, 1, 'Soleado', 79.00, 69.00),
(33, 4, 4, '2022-07-03', 1580.00, 109000.00, 6900.00, 2, 'Nublado', 77.00, 67.00),
(34, 4, 4, '2022-07-04', 1610.00, 110500.00, 7050.00, 1, 'Soleado', 78.50, 68.50),
(35, 4, 4, '2022-07-05', 1590.00, 109500.00, 6975.00, 0, 'Nublado', 77.50, 67.50),
(36, 4, 4, '2022-07-06', 1605.00, 110250.00, 7025.00, 1, 'Soleado', 78.25, 68.25),
(37, 4, 4, '2022-07-07', 1615.00, 110750.00, 7075.00, 2, 'Nublado', 78.75, 68.75),
(38, 4, 4, '2022-07-08', 1625.00, 111250.00, 7125.00, 3, 'Soleado', 79.25, 69.25),
(39, 4, 4, '2022-07-09', 1585.00, 109250.00, 6950.00, 0, 'Nublado', 77.25, 67.25),
(40, 4, 4, '2022-07-10', 1575.00, 108750.00, 6925.00, 1, 'Soleado', 76.75, 66.75),
(41, 5, 5, '2023-02-01', 1700.00, 130000.00, 7500.00, 4, 'Frío', 82.00, 70.00),
(42, 5, 5, '2023-02-02', 1720.00, 131000.00, 7600.00, 3, 'Nublado', 83.00, 71.00),
(43, 5, 5, '2023-02-03', 1680.00, 129000.00, 7400.00, 5, 'Frío', 81.00, 69.00),
(44, 5, 5, '2023-02-04', 1710.00, 130500.00, 7550.00, 4, 'Soleado', 82.50, 70.50),
(45, 5, 5, '2023-02-05', 1690.00, 129500.00, 7475.00, 3, 'Nublado', 81.50, 69.50),
(46, 5, 5, '2023-02-06', 1705.00, 130250.00, 7525.00, 2, 'Frío', 82.25, 70.25),
(47, 5, 5, '2023-02-07', 1715.00, 130750.00, 7575.00, 4, 'Nublado', 82.75, 70.75),
(48, 5, 5, '2023-02-08', 1725.00, 131250.00, 7625.00, 5, 'Soleado', 83.25, 71.25),
(49, 5, 5, '2023-02-09', 1685.00, 129250.00, 7450.00, 3, 'Frío', 81.25, 69.25),
(50, 5, 5, '2023-02-10', 1675.00, 128750.00, 7425.00, 4, 'Nublado', 80.75, 68.75);

-- Estructura de tabla para la tabla `empresas`
CREATE TABLE empresas (
  id_empresa INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT DEFAULT NULL,
  industria TEXT DEFAULT NULL,
  proyecto_id INTEGER,
  FOREIGN KEY (proyecto_id) REFERENCES proyectos(id_proyecto)
);

-- Volcado de datos para la tabla `empresas`
INSERT INTO empresas (id_empresa, nombre, industria, proyecto_id) VALUES
(1, 'SolarTech', 'Energía Solar', 1),
(2, 'WindPower', 'Energía Eólica', 2),
(3, 'GreenH2', 'Hidrógeno Verde', 3),
(4, 'BioEnergy', 'Biomasa', 4),
(5, 'GeoEnergy', 'Geotermia', 5);

-- Estructura de tabla para la tabla `estudios`
CREATE TABLE estudios (
  id_estudio INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL,
  descripcion TEXT DEFAULT NULL,
  fecha DATE DEFAULT NULL,
  proyecto_id INTEGER,
  FOREIGN KEY (proyecto_id) REFERENCES proyectos(id_proyecto)
);

-- Volcado de datos para la tabla `estudios`
INSERT INTO estudios (id_estudio, nombre, descripcion, fecha, proyecto_id) VALUES
(1, 'Estudio de Viabilidad Solar', 'Análisis de viabilidad para la planta solar en Andes', '2021-12-01', 1),
(2, 'Impacto Ambiental Eólico', 'Evaluación del impacto ambiental del parque eólico en La Guajira', '2020-11-01', 2),
(3, 'Producción de Hidrógeno', 'Estudio de métodos de producción de hidrógeno verde', '2022-05-01', 3),
(4, 'Biomasa y Sostenibilidad', 'Análisis de sostenibilidad de la planta de biomasa en Cauca', '2021-09-01', 4),
(5, 'Eficiencia Geotérmica', 'Estudio de eficiencia de la planta geotérmica en Nariño', '2023-03-01', 5);

-- Estructura de tabla para la tabla `inversiones`
CREATE TABLE inversiones (
  id_inversion INTEGER PRIMARY KEY AUTOINCREMENT,
  proyecto_id INTEGER,
  monto REAL DEFAULT NULL,
  fuente TEXT DEFAULT NULL,
  fecha DATE DEFAULT NULL,
  FOREIGN KEY (proyecto_id) REFERENCES proyectos(id_proyecto)
);

-- Volcado de datos para la tabla `inversiones`
INSERT INTO inversiones (id_inversion, proyecto_id, monto, fuente, fecha) VALUES
(1, 1, 1000000.00, 'Gobierno', '2022-01-01'),
(2, 2, 5000000.00, 'Privado', '2021-06-01'),
(3, 3, 2000000.00, 'Gobierno', '2023-04-01'),
(4, 4, 1500000.00, 'ONG', '2022-07-01'),
(5, 5, 3000000.00, 'Privado', '2023-02-01');

-- Estructura de tabla para la tabla `investigadores`
CREATE TABLE investigadores (
  id_investigador INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT DEFAULT NULL,
  apellido TEXT DEFAULT NULL,
  especialidad TEXT DEFAULT NULL,
  proyecto_id INTEGER,
  FOREIGN KEY (proyecto_id) REFERENCES proyectos(id_proyecto)
);

-- Volcado de datos para la tabla `investigadores`
INSERT INTO investigadores (id_investigador, nombre, apellido, especialidad, proyecto_id) VALUES
(1, 'Juan', 'Pérez', 'Energía Solar', 1),
(2, 'Ana', 'Gómez', 'Energía Eólica', 2),
(3, 'Luis', 'Martínez', 'Hidrógeno Verde', 3),
(4, 'María', 'Rodríguez', 'Biomasa', 4),
(5, 'Carlos', 'López', 'Geotermia', 5);

-- Estructura de tabla para la tabla `minerales`
CREATE TABLE minerales (
  id_mineral INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL,
  descripcion TEXT DEFAULT NULL,
  ubicacion TEXT DEFAULT NULL,
  proyecto_asociado INTEGER,
  FOREIGN KEY (proyecto_asociado) REFERENCES proyectos(id_proyecto)
);

-- Volcado de datos para la tabla `minerales`
INSERT INTO minerales (id_mineral, nombre, descripcion, ubicacion, proyecto_asociado) VALUES
(1, 'Litio', 'Mineral estratégico para baterías', 'Cauca', 1),
(2, 'Cobalto', 'Mineral estratégico para componentes electrónicos', 'Boyacá', 2),
(3, 'Níquel', 'Mineral estratégico para aleaciones metálicas', 'Antioquia', 3),
(4, 'Cobre', 'Mineral estratégico para conductividad eléctrica', 'Chocó', 4),
(5, 'Uranio', 'Mineral estratégico para energía nuclear', 'Guainía', 5);

-- Estructura de tabla para la tabla `proyectos`
CREATE TABLE proyectos (
  id_proyecto INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL,
  descripcion TEXT DEFAULT NULL,
  tipo_energia INTEGER,
  ubicacion TEXT DEFAULT NULL,
  fecha_inicio DATE DEFAULT NULL,
  fecha_fin DATE DEFAULT NULL,
  FOREIGN KEY (tipo_energia) REFERENCES tipos_energia(id_tipo)
);

-- Volcado de datos para la tabla `proyectos`
INSERT INTO proyectos (id_proyecto, nombre, descripcion, tipo_energia, ubicacion, fecha_inicio, fecha_fin) VALUES
(1, 'Proyecto Solar Andes', 'Desarrollo de una planta de energía solar', 3, 'Andes', '2022-01-01', '2023-01-01'),
(2, 'Parque Eólico La Guajira', 'Generación de energía eólica', 2, 'La Guajira', '2021-05-01', '2022-12-01'),
(3, 'Planta Hidrógeno Verde', 'Producción de hidrógeno verde', 1, 'Cartagena', '2023-03-01', '2024-03-01'),
(4, 'Proyecto Biomasa Cauca', 'Generación de energía a partir de biomasa', 4, 'Cauca', '2022-06-01', '2023-06-01'),
(5, 'Planta Geotérmica Nariño', 'Producción de energía geotérmica', 5, 'Nariño', '2023-01-01', '2024-01-01');

-- Estructura de tabla para la tabla `tipos_energia`
CREATE TABLE tipos_energia (
  id_tipo INTEGER PRIMARY KEY AUTOINCREMENT,
  tipo TEXT NOT NULL
);

-- Volcado de datos para la tabla `tipos_energia`
INSERT INTO tipos_energia (id_tipo, tipo) VALUES
(1, 'Hidrógeno Verde'),
(2, 'Eólica'),
(3, 'Solar'),
(4, 'Biomasa'),
(5, 'Geotérmica');