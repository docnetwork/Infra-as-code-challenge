locals {
  tags = {
    Application = "IAC Test"
  }

  name_suffix = "-${var.app_name}-${var.environment}-${var.short_region}"
}
