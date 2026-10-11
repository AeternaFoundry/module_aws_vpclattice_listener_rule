resource "aws_vpclattice_listener_rule" "vpclattice_listener_rules" {
  for_each = var.vpclattice_listener_rules

  listener_identifier = each.value.listener_identifier
  name                = each.value.name
  priority            = each.value.priority
  service_identifier  = each.value.service_identifier
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all

  action {
    dynamic "fixed_response" {
      for_each = each.value.action.fixed_response != null ? [each.value.action.fixed_response] : []
      content {
        status_code = fixed_response.value.status_code
      }
    }
    dynamic "forward" {
      for_each = each.value.action.forward != null ? [each.value.action.forward] : []
      content {
        dynamic "target_groups" {
          for_each = forward.value.target_groups
          content {
            target_group_identifier = target_groups.value.target_group_identifier
            weight                  = target_groups.value.weight
          }
        }
      }
    }
  }

  match {
    http_match {
      dynamic "header_matches" {
        for_each = each.value.match.http_match.header_matches != null ? each.value.match.http_match.header_matches : []
        content {
          case_sensitive = header_matches.value.case_sensitive
          match {
            contains = header_matches.value.match.contains
            exact    = header_matches.value.match.exact
            prefix   = header_matches.value.match.prefix
          }
          name = header_matches.value.name
        }
      }
      method = each.value.match.http_match.method
      dynamic "path_match" {
        for_each = each.value.match.http_match.path_match != null ? [each.value.match.http_match.path_match] : []
        content {
          case_sensitive = path_match.value.case_sensitive
          match {
            exact  = path_match.value.match.exact
            prefix = path_match.value.match.prefix
          }
        }
      }
    }
  }
}

