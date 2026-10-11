output "vpclattice_listener_rules_id" {
  description = "Map of id values across all vpclattice_listener_rules, keyed the same as var.vpclattice_listener_rules"
  value       = { for k, v in aws_vpclattice_listener_rule.vpclattice_listener_rules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "vpclattice_listener_rules_action" {
  description = "Map of action values across all vpclattice_listener_rules, keyed the same as var.vpclattice_listener_rules"
  value       = { for k, v in aws_vpclattice_listener_rule.vpclattice_listener_rules : k => one(v.action) if v.action != null && length(v.action) > 0 }
}
output "vpclattice_listener_rules_arn" {
  description = "Map of arn values across all vpclattice_listener_rules, keyed the same as var.vpclattice_listener_rules"
  value       = { for k, v in aws_vpclattice_listener_rule.vpclattice_listener_rules : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "vpclattice_listener_rules_listener_identifier" {
  description = "Map of listener_identifier values across all vpclattice_listener_rules, keyed the same as var.vpclattice_listener_rules"
  value       = { for k, v in aws_vpclattice_listener_rule.vpclattice_listener_rules : k => v.listener_identifier if v.listener_identifier != null && length(v.listener_identifier) > 0 }
}
output "vpclattice_listener_rules_match" {
  description = "Map of match values across all vpclattice_listener_rules, keyed the same as var.vpclattice_listener_rules"
  value       = { for k, v in aws_vpclattice_listener_rule.vpclattice_listener_rules : k => one(v.match) if v.match != null && length(v.match) > 0 }
}
output "vpclattice_listener_rules_name" {
  description = "Map of name values across all vpclattice_listener_rules, keyed the same as var.vpclattice_listener_rules"
  value       = { for k, v in aws_vpclattice_listener_rule.vpclattice_listener_rules : k => v.name if v.name != null && length(v.name) > 0 }
}
output "vpclattice_listener_rules_priority" {
  description = "Map of priority values across all vpclattice_listener_rules, keyed the same as var.vpclattice_listener_rules"
  value       = { for k, v in aws_vpclattice_listener_rule.vpclattice_listener_rules : k => v.priority if v.priority != null }
}
output "vpclattice_listener_rules_region" {
  description = "Map of region values across all vpclattice_listener_rules, keyed the same as var.vpclattice_listener_rules"
  value       = { for k, v in aws_vpclattice_listener_rule.vpclattice_listener_rules : k => v.region if v.region != null && length(v.region) > 0 }
}
output "vpclattice_listener_rules_rule_id" {
  description = "Map of rule_id values across all vpclattice_listener_rules, keyed the same as var.vpclattice_listener_rules"
  value       = { for k, v in aws_vpclattice_listener_rule.vpclattice_listener_rules : k => v.rule_id if v.rule_id != null && length(v.rule_id) > 0 }
}
output "vpclattice_listener_rules_service_identifier" {
  description = "Map of service_identifier values across all vpclattice_listener_rules, keyed the same as var.vpclattice_listener_rules"
  value       = { for k, v in aws_vpclattice_listener_rule.vpclattice_listener_rules : k => v.service_identifier if v.service_identifier != null && length(v.service_identifier) > 0 }
}
output "vpclattice_listener_rules_tags" {
  description = "Map of tags values across all vpclattice_listener_rules, keyed the same as var.vpclattice_listener_rules"
  value       = { for k, v in aws_vpclattice_listener_rule.vpclattice_listener_rules : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "vpclattice_listener_rules_tags_all" {
  description = "Map of tags_all values across all vpclattice_listener_rules, keyed the same as var.vpclattice_listener_rules"
  value       = { for k, v in aws_vpclattice_listener_rule.vpclattice_listener_rules : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

