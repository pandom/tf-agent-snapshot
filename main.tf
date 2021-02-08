provider "nomad" {
    address = var.nomad_address
}

resource "nomad_job" "app" {
  jobspec = file("${path.module}/jobs/redist.nomad")
}
