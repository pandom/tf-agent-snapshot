terraform {
  required_providers {
    nomad = {
      source = "hashicorp/nomad"
      version = "1.4.13"
    }
  }
}
provider "nomad" {
    address = "http://10.0.0.25:4646"
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


resource "nomad_quota_specification" "web_team" {
  name        = "web-team"
  description = "web team quota"

  limits {
    region = "prod"

    region_limit {
      cpu       = 1000
      memory_mb = 2048
    }
  }
}

resource "nomad_quota_specification" "snapshot" {
  name        = "snapshot"
  description = "snapshot"

  limits {
    region = "prod"

    region_limit {
      cpu       = 1000
      memory_mb = 512
    }
  }
}

resource "nomad_namespace" "web" {
  name        = "web"
  description = "Web team production environment"
  quota       = nomad_quota_specification.web_team.name
}

resource "nomad_namespace" "snapshot" {
  name        = "snapshot"
  description = "custom namespace for snapshot"
  quota       = nomad_quota_specification.snapshot.name
}
