provider "nomad" {
    address = var.nomad_address
    region = "DC1"
}
#Backend Nomad Configuration
resource "nomad_scheduler_config" "config" {
  scheduler_algorithm = "spread"
  preemption_config = {
    system_scheduler_enabled  = true
    batch_scheduler_enabled   = true
    service_scheduler_enabled = true
  }
}

// resource "nomad_job" "app" {
//   jobspec = file("${path.module}/jobs/redist.nomad")
// }

resource "nomad_namespace" "dev" {
  name        = "dev"
  description = "Shared development environment."
  quota       = "dev"
}

resource "nomad_namespace" "production" {
  name        = "production"
  description = "Shared development environment."
  quota       = "production"
}

resource "nomad_namespace" "playground" {
  name        = "playground"
  description = "Shared development environment."
  quota       = "playground"
}

resource "nomad_quota_specification" "prod_api" {
  name        = "prod-api"
  description = "Production instances of backend API servers"

  limits {
    region = "DC1"

    region_limit {
      cpu       = 2400
      memory_mb = 1200
    }
  }
}