/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.schema.hasTable("clientes").then(function (exists) {
    if (!exists) {
      /* Si la tabla no existe, voy a crear una nueva tabla */
      return knex.schema.createTable("clientes", function (table) {
        // sintaxis: table.tipoDeDato("nombreAtributo").chainableMethods
        table.increments("cliente_id").primary(); // en knex usamos increments en vez de serial como tipo de dato
        table.string("nombre").notNullable(); // notNullable es que no puede quedar nulo (not null)
        table.string("apellido_paterno").notNullable(); 
        table.string("apellido_materno").notNullable(); 
        table.string("calle"); 
        table.string("numero_exterior"); 
        table.string("colonia"); 
        table.string("municipio").notNullable(); 
        table.string("estado").notNullable(); 
        table.string("telefono"); 
        table.string("correo"); 
        table.timestamp("fechaHora_registro").defaultTo(knex.fn.now()); // knex.fn.now() me devuelve la fecha y hora actual al momento se crear el registro en la base de datos.
      });
    }
  });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
    return knex.schema.hasTable("clientes").then(function (exists) {
        if (exists) {
            return knex.schema.dropTable("clientes");
        }
    })
};
