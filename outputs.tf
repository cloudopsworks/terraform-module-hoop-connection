##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

output "connections" {
  description = "Map of created Hoop connection IDs and names, keyed by the same keys as var.connections."
  value = {
    for k, conn in hoop_connection.this : k => {
      id   = conn.id
      name = conn.name
    }
  }
}
