job "tfcagent" {
  datacenters = ["DC1"]
  type = "service"
  
  group "tfcagent" {
    // network {
    //     port "https" {}
    //     mode = "host"
    // }
    count = 1
    task "tfcagent" {
    //    template {
    // data = <<EOF
    //   TFC_AGENT_TOKEN = "{{with secret "secret/data/nomad"}}{{.Data.data.tfc_agent_token}}{{end}}"
    //   EOF
    //   }
    //   vault {
    //     policies = ["tfc-agent"]

    //     change_mode   = "signal"
    //     change_signal = "SIGUSR1"
    //         }
      driver = "docker"
      env {
        TFC_AGENT_TOKEN             = "tHpaPyeZYXOu2w.atlasv1.6ZlKK5bBosqRWBga9LP0WNfzQBx8L2pemvWy2j8iZ1W9NHAW7Jvwlf3JWGCWRly78eI"
        TFC_ADDRESS                 = "https://app.terraform.io"
        TFC_AGENT_LOG_LEVEL         = "debug"
        TFC_AGENT_DISABLE_UPDATE    = "true"
        TFC_AGENT_NAME              = "NOMAD-TF-AGENT-01"
      }
      config {
          image = "hashicorp/tfc-agent:latest"
      }
    }
  }
}