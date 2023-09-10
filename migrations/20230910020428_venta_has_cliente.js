/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.schema.hasTable("ventas").then(function (exists) {
    if (exists) {
      return knex.schema.table("ventas", function (table) {
        table
          .integer("fk_cliente")
          .unsigned()
          .references("clientes.cliente_id");
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
        table.dropColumn("fk_cliente");
      });
    }
  });
};
