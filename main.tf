##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

import {
  for_each = { for k, conn in var.connections : k => conn if conn.import }
  id       = each.value.name
  to       = hoop_connection.this[each.key]
}

resource "hoop_connection" "this" {
  for_each = var.connections

  name                 = each.value.name
  agent_id             = each.value.agent_id
  type                 = each.value.type
  subtype              = each.value.subtype
  secrets              = each.value.secrets
  access_mode_connect  = try(each.value.access_modes.connect, "enabled")
  access_mode_exec     = try(each.value.access_modes.exec, "enabled")
  access_mode_runbooks = try(each.value.access_modes.runbooks, "enabled")
  access_schema        = try(each.value.access_modes.schema, "enabled")
  tags                 = merge(local.all_tags, each.value.tags)

  lifecycle {
    ignore_changes = [command]
  }
}

resource "hoop_plugin_connection" "this" {
  for_each      = { for k, conn in var.connections : k => conn if length(try(conn.access_control, [])) > 0 }
  connection_id = hoop_connection.this[each.key].id
  plugin_name   = "access_control"
  config        = each.value.access_control
}
