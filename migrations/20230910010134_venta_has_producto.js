/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.schema.hasTable("ventas").then(function (exists) {
    if (exists) {
      return knex.schema.table("ventas", function (table) {
        table.integer("fk_producto").unsigned().references("productos.productos_id");
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
      return knex.schema.table("ventas", function (table) {
        table.dropColumn("fk_producto");
      });
    }
  });
};
