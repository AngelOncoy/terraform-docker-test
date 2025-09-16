resource "docker_container" "redis" {
  image = "redis"
  name  = "redis_8.2.1-bookworm"
  ports {
    external = var.web_server_port_external_redis
    internal = 6379
  }
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}


resource "docker_container" "postgres" {
  image = "postgres"
  name  = "postgres_13-trixie"

  env = [
    "POSTGRES_PASSWORD=password"
  ]

  ports {
    external = var.web_server_port_external_postgres
    internal = 5432
  }

  networks_advanced {
    name = docker_network.persistence_net.name
  }
}
