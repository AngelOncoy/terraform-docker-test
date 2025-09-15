resource "docker_network" "app_net" {
  name = "dev-app_net"
}

resource "docker_container" "app1" {
  name  = "app1"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8010
  }
  networks_advanced {
    name    = docker_network.app_net.name
    aliases = ["app1"]
  }
}

resource "docker_container" "app2" {
  name  = "app2"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8020
  }
  networks_advanced {
    name    = docker_network.app_net.name
    aliases = ["app2"]
  }
}

resource "docker_container" "app3" {
  name  = "app3"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8030
  }
  networks_advanced {
    name    = docker_network.app_net.name
    aliases = ["app3"]
  }

}
