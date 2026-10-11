variable "vpclattice_listener_rules" {
  description = <<EOT
Map of vpclattice_listener_rules, attributes below
Required:
    - listener_identifier
    - name
    - priority
    - service_identifier
    - action (block):
        - fixed_response (optional, block):
            - status_code (required)
        - forward (optional, block):
            - target_groups (required, block):
                - target_group_identifier (required)
                - weight (optional)
    - match (block):
        - http_match (required, block):
            - header_matches (optional, block):
                - case_sensitive (optional)
                - match (required, block):
                    - contains (optional)
                    - exact (optional)
                    - prefix (optional)
                - name (required)
            - method (optional)
            - path_match (optional, block):
                - case_sensitive (optional)
                - match (required, block):
                    - exact (optional)
                    - prefix (optional)
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    listener_identifier = string
    name                = string
    priority            = number
    service_identifier  = string
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
    action = object({
      fixed_response = optional(object({
        status_code = number
      }))
      forward = optional(object({
        target_groups = list(object({
          target_group_identifier = string
          weight                  = optional(number)
        }))
      }))
    })
    match = object({
      http_match = object({
        header_matches = optional(list(object({
          case_sensitive = optional(bool)
          match = object({
            contains = optional(string)
            exact    = optional(string)
            prefix   = optional(string)
          })
          name = string
        })))
        method = optional(string)
        path_match = optional(object({
          case_sensitive = optional(bool)
          match = object({
            exact  = optional(string)
            prefix = optional(string)
          })
        }))
      })
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.vpclattice_listener_rules : (
        v.action.forward == null || (length(v.action.forward.target_groups) >= 1)
      )
    ])
    error_message = "Each target_groups list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpclattice_listener_rules : (
        v.match.http_match.header_matches == null || (length(v.match.http_match.header_matches) <= 5)
      )
    ])
    error_message = "Each header_matches list must contain at most 5 items"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

