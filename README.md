# Mini Proyecto Concentrador de Análisis y Diseño SQL - Abarrotes Don Rufino

Este proyecto tiene como objetivo migrar el sistema de ventas de Abarrotes "Don Rufino" a una base de datos SQL, permitiendo registrar productos y clientes, así como realizar consultas específicas en la base de datos. A continuación, se describen las principales características y pasos del proyecto.

## Características del Proyecto

Abarrotes "Don Rufino", el mayor distribuidor de abarrotes de México, necesita migrar su sistema de ventas a una base de datos. Las características clave del proyecto son:

### Productos
- Nombre
- Descripción
- Precio
- Cantidad

### Clientes
- Nombre
- Apellidos
- Email
- Teléfono
- Dirección con calle
- Código postal
- Barrio o Colonia
- Ciudad
- Estado

### Personal
- Nombre
- Apellidos
- Puesto
- Email
- Teléfono
- Dirección con calle
- Código postal
- Barrio o Colonia
- Ciudad
- Estado

### Ventas
- Las tienditas registran las ventas a clientes.
- Una venta puede contener diferentes productos y cantidades.

## Pasos del Proyecto

El proyecto se divide en los siguientes pasos:

1. **Modelo Relacional:** Diseñar un modelo relacional que describa la estructura de la base de datos.

2. **Diagrama Entidad-Relación o Schema:** Crear un diagrama entidad-relación que visualice las relaciones entre las entidades y atributos.

3. **Migraciones con Knex:** Utilizar Knex.js para crear las migraciones que definan las tablas de la base de datos y sus relaciones.

4. **Poblar la Base de Datos:** Insertar algunos registros de ejemplo en la base de datos para propósitos de prueba y desarrollo.

5. **Consultas SQL:** Generar las siguientes consultas SQL:

   - ID de los clientes de la Ciudad de Monterrey.
   - ID y descripción de los productos que cuesten menos de 15 pesos.
   - ID y nombre de los clientes, cantidad vendida y descripción del producto en ventas con más de 10 unidades.
   - ID y nombre de los clientes que no aparecen en la tabla de ventas (clientes que no han comprado productos).
   - ID y nombre de los clientes que han comprado todos los productos de la empresa.
   - ID y nombre de cada cliente y la suma total de cantidad de los productos que ha comprado.
   - ID de los productos que no han sido comprados por clientes de Guadalajara.
   - ID de los productos que se han vendido a clientes de Monterrey y también a clientes de Cancún.
   - Nombre de las ciudades en las que se han vendido todos los productos.

## Ejecución del Proyecto

Para ejecutar el proyecto, asegúrate de tener una base de datos SQL configurada y seguir los pasos de migración y población descritos en el código fuente del proyecto.