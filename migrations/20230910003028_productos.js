/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.schema.hasTable("productos").then(function (exists) {
    if (!exists) {
      return knex.schema.createTable("productos", function (table) {
        table.increments("productos_id").primary(); 
        table.string("nombre").notNullable(); 
        table.string("descripcion");
        table.integer("cantidad").defaultTo(1);
        table.decimal("precio", 8, 2).notNullable();
        table.timestamp("fechaHora_registro").defaultTo(knex.fn.now()); 
      });
    }
  });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
    return knex.schema.hasTable("productos").then(function (exists) {
        if (exists) {
            return knex.schema.dropTable("productos");
        }
    })
};
