provider "nomad" {
    address = var.nomad_address
}

resource "nomad_job" "snapshot_app" {
    jobspec = file(./jobs/redist.nomad)
}
