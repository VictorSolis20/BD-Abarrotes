/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.schema.hasTable("ventas").then(function (exists) {
    if (!exists) {
      return knex.schema.createTable("ventas", function (table) {
        table.increments("venta_id").primary();
        table.integer("cantidad_productos").defaultTo(1);
        table.decimal("total", 10, 2).notNullable();
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
    return knex.schema.hasTable("ventas").then(function (exists) {
        if (exists) {
            return knex.schema.dropTable("ventas");
        }
    })
};
