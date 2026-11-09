# 📊 RetailPro / TechStore – Proyecto de Análisis de Datos

**Proyecto académico | Curso de Data Analyst**

## 📌 Descripción del proyecto

Este repositorio contiene el desarrollo de un proyecto de análisis de datos realizado en el marco de un curso de **Data Analyst**.

El caso de estudio se basa en **RetailPro / TechStore**, una empresa ficticia dedicada al retail de tecnología. El objetivo es trabajar con datos comerciales para transformarlos en información útil para la toma de decisiones del negocio.

A lo largo del proyecto se desarrollan diferentes etapas del proceso de análisis de datos: creación y estructuración de una base de datos, consultas SQL para responder preguntas de negocio, integración de información mediante JOIN y construcción de un modelo de datos y un dashboard en Power BI.

## 🎯 Objetivos del proyecto

- Diseñar y crear una base de datos relacional para gestionar información comercial.
- Realizar consultas SQL para obtener métricas e indicadores de negocio.
- Analizar ventas, productos y comportamiento de clientes.
- Aplicar diferentes tipos de JOIN para integrar información de múltiples tablas.
- Construir un modelo de datos en estrella.
- Crear medidas DAX y visualizaciones interactivas en Power BI.
- Transformar datos en información relevante para la toma de decisiones comerciales.

## 🛠️ Herramientas y tecnologías

| Herramienta | Aplicación |
|---|---|
| SQL Server | Gestión y consulta de bases de datos |
| SQL Server Management Studio (SSMS) | Creación y ejecución de scripts SQL |
| Power BI Desktop | Modelado y visualización de datos |
| Power Query | Limpieza y transformación de datos |
| DAX | Creación de medidas e indicadores |
| Microsoft Excel | Trabajo y análisis de datos |

## 📁 Estructura del repositorio

```text
curso-data-analyst/
│
├── TP3_QuirogaFernanda/
│   └── ventas_tech_db.sql
│
├── RetailPro/
│   ├── m4_consultas_negocio.sql
│   └── m5_consultas_joins.sql
│
└── tp8/
    └── Quiroga_MariaFernanda_Checkpoint2.pbix
```

### 📂 Descripción de los archivos

**1. TP3_QuirogaFernanda/ventas_tech_db.sql**

Creación y preparación de la base de datos `Ventas_Tech_DB`.

Incluye:
- Eliminación previa de las tablas (`DROP TABLE IF EXISTS`), para que el script se pueda ejecutar varias veces sin errores.
- Creación de las cuatro tablas: `categorias`, `clientes`, `productos` y `ventas`.
- Carga de datos.
- Consultas de validación para comprobar la correcta estructura y carga de información.

**2. RetailPro/m4_consultas_negocio.sql**

Desarrollo de consultas SQL orientadas al análisis comercial.

Incluye métricas como:
- Resumen mensual de ventas.
- Ranking de productos por facturación.
- Identificación de clientes recurrentes.

**3. RetailPro/m5_consultas_joins.sql**

Consultas para integrar información de distintas tablas y ampliar el análisis de negocio.

Se aplican:
- `INNER JOIN`
- `LEFT JOIN`
- `UNION ALL`

**4. tp8/Quiroga_MariaFernanda_Checkpoint2.pbix**

Desarrollo del modelo de datos y análisis en Power BI.

Incluye:
- Limpieza de datos en Power Query (duplicados, nulos y tipos de datos) sobre `Pipeline_ETL_Dataset.xlsx`.
- Modelo de datos en estrella con relaciones 1:N y dirección de filtro única.
- Tabla calendario `Dim_Fechas`, marcada como tabla de fechas.
- Tabla `_Medidas` con cinco medidas DAX: `Total Ventas`, `Ventas Online`, `Ventas YTD`, `Ventas LY` y `% Crecimiento Anual`.
- Página de validación con una matriz que comprueba los cálculos de inteligencia de tiempo.

> El dashboard final se desarrolla en una etapa posterior del curso.

## ⚙️ Cómo ejecutar el proyecto

Para reproducir el análisis, se recomienda seguir el siguiente orden:

### Paso 1. Crear la base de datos

1. Abrir SQL Server Management Studio (SSMS).
2. Conectarse a una instancia de SQL Server.
3. Crear la base de datos en una consulta nueva (se hace una sola vez, no está incluido en el script):
   ```sql
   CREATE DATABASE Ventas_Tech_DB;
   ```
4. Abrir `TP3_QuirogaFernanda/ventas_tech_db.sql`.
5. Ejecutar el script completo.
6. Verificar que las consultas de validación devuelvan 4, 5, 6 y 10 filas (categorías, clientes, productos y ventas).

### Paso 2. Ejecutar las consultas de negocio

1. Abrir `RetailPro/m4_consultas_negocio.sql`.
2. Seleccionar la base de datos `Ventas_Tech_DB`.
3. Ejecutar las consultas para obtener las métricas comerciales.

### Paso 3. Analizar las relaciones entre tablas

1. Abrir `RetailPro/m5_consultas_joins.sql`.
2. Seleccionar la base de datos `Ventas_Tech_DB`.
3. Ejecutar las consultas para integrar y analizar información de ventas, clientes, productos y categorías.

### Paso 4. Abrir el proyecto en Power BI

1. Abrir Power BI Desktop.
2. Cargar el archivo `tp8/Quiroga_MariaFernanda_Checkpoint2.pbix`.
3. El modelo toma los datos del archivo Excel `Pipeline_ETL_Dataset.xlsx` (no de SQL Server). Si la ruta del archivo no coincide con la de tu equipo, actualizarla en **Transformar datos → Configuración de origen de datos → Cambiar origen**.
4. Actualizar los datos y verificar el modelo.
5. Explorar las medidas DAX y las visualizaciones desarrolladas.

## 📈 Resultados y aprendizajes

Este proyecto permite aplicar conocimientos fundamentales del análisis de datos en un caso de negocio de retail tecnológico.

Entre los principales aprendizajes se destacan:

- Diseño y gestión de bases de datos relacionales.
- Escritura y optimización de consultas SQL.
- Integración y análisis de datos mediante JOIN.
- Identificación de indicadores comerciales.
- Modelado dimensional y estructura en estrella.
- Transformación de datos con Power Query.
- Creación de métricas mediante DAX.
- Comunicación de resultados a través de dashboards.

## 👩‍💻 Autora

**María Fernanda Quiroga**

Proyecto desarrollado como parte del curso de Data Analyst.

---

*Este repositorio documenta el proceso de aprendizaje y aplicación práctica de herramientas de análisis de datos, desde la preparación de la información hasta la generación de indicadores para la toma de decisiones.*
