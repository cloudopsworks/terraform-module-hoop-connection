## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_hoop"></a> [hoop](#requirement\_hoop) | ~> 0.0.18 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hoop"></a> [hoop](#provider\_hoop) | 0.0.19 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | cloudopsworks/tags/local | 1.0.9 |

## Resources

| Name | Type |
|------|------|
| [hoop_connection.this](https://registry.terraform.io/providers/hoophq/hoop/latest/docs/resources/connection) | resource |
| [hoop_plugin_connection.this](https://registry.terraform.io/providers/hoophq/hoop/latest/docs/resources/plugin_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connections"></a> [connections](#input\_connections) | connections:<br/>  <connection\_key>:<br/>    name: "my-connection"        # (Required) Unique connection identifier in Hoop.<br/>    agent\_id: "uuid"             # (Required) Hoop agent UUID.<br/>    type: "database"             # (Required) Connection type. Allowed: database, application, custom.<br/>    subtype: "mongodb"           # (Optional) Connection subtype. For database: mysql, postgresql, sqlserver, oracle, mongodb, redis, redshift. For application: ssh, rdp. Default: null.<br/>    secrets:                     # (Optional) Secret env vars map. Key prefix: envvar:KEY or filesystem:KEY. Default: null.<br/>      envvar:CONNECTION\_STRING: "\_aws:my-secret:connection\_string"<br/>    access\_modes:                # (Optional) Access mode configuration per type.<br/>      connect: "enabled"         # (Optional) Connect mode. Allowed: enabled, disabled. Default: "enabled".<br/>      exec: "enabled"            # (Optional) Exec mode. Allowed: enabled, disabled. Default: "enabled".<br/>      runbooks: "enabled"        # (Optional) Runbooks mode. Allowed: enabled, disabled. Default: "enabled".<br/>      schema: "enabled"          # (Optional) Schema mode. Allowed: enabled, disabled. Default: "enabled".<br/>    tags:                        # (Optional) Free-form tags map. Default: {}.<br/>      key: "value"<br/>    access\_control:              # (Optional) Access control group set. Default: [].<br/>      - "group-name"<br/>    import: false                # (Optional) When true, imports existing Hoop connection instead of creating. Default: false. | <pre>map(object({<br/>    name     = string<br/>    agent_id = string<br/>    type     = string<br/>    subtype  = optional(string, null)<br/>    secrets  = optional(map(string), null)<br/>    access_modes = optional(object({<br/>      connect  = optional(string, "enabled")<br/>      exec     = optional(string, "enabled")<br/>      runbooks = optional(string, "enabled")<br/>      schema   = optional(string, "enabled")<br/>    }), {})<br/>    tags           = optional(map(string), {})<br/>    access_control = optional(set(string), [])<br/>    import         = optional(bool, false)<br/>  }))</pre> | `{}` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add to the resources | `map(string)` | `{}` | no |
| <a name="input_is_hub"></a> [is\_hub](#input\_is\_hub) | Is this a hub or spoke configuration? | `bool` | `false` | no |
| <a name="input_org"></a> [org](#input\_org) | Organization details | <pre>object({<br/>    organization_name = string<br/>    organization_unit = string<br/>    environment_type  = string<br/>    environment_name  = string<br/>  })</pre> | n/a | yes |
| <a name="input_spoke_def"></a> [spoke\_def](#input\_spoke\_def) | Spoke ID Number, must be a 3 digit number | `string` | `"001"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connections"></a> [connections](#output\_connections) | Map of created Hoop connection IDs and names, keyed by the same keys as var.connections. |
