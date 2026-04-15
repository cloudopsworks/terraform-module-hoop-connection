##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

variable "connections" {
  description = <<-EOD
  connections:
    <connection_key>:
      name: "my-connection"        # (Required) Unique connection identifier in Hoop.
      agent_id: "uuid"             # (Required) Hoop agent UUID.
      type: "database"             # (Required) Connection type. Allowed: database, application, custom.
      subtype: "mongodb"           # (Optional) Connection subtype. For database: mysql, postgresql, sqlserver, oracle, mongodb, redis, redshift. For application: ssh, rdp. Default: null.
      secrets:                     # (Optional) Secret env vars map. Key prefix: envvar:KEY or filesystem:KEY. Default: null.
        envvar:CONNECTION_STRING: "_aws:my-secret:connection_string"
      access_modes:                # (Optional) Access mode configuration per type.
        connect: "enabled"         # (Optional) Connect mode. Allowed: enabled, disabled. Default: "enabled".
        exec: "enabled"            # (Optional) Exec mode. Allowed: enabled, disabled. Default: "enabled".
        runbooks: "enabled"        # (Optional) Runbooks mode. Allowed: enabled, disabled. Default: "enabled".
        schema: "enabled"          # (Optional) Schema mode. Allowed: enabled, disabled. Default: "enabled".
      tags:                        # (Optional) Free-form tags map. Default: {}.
        key: "value"
      access_control:              # (Optional) Access control group set. Default: [].
        - "group-name"
      import: false                # (Optional) When true, imports existing Hoop connection instead of creating. Default: false.
  EOD
  type = map(object({
    name     = string
    agent_id = string
    type     = string
    subtype  = optional(string, null)
    secrets  = optional(map(string), null)
    access_modes = optional(object({
      connect  = optional(string, "enabled")
      exec     = optional(string, "enabled")
      runbooks = optional(string, "enabled")
      schema   = optional(string, "enabled")
    }), {})
    tags           = optional(map(string), {})
    access_control = optional(set(string), [])
    import         = optional(bool, false)
  }))
  default = {}
}
