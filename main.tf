terraform {
  required_providers {
    docker = {
      source  = "abh80/docker"
      version = "1.0.1"
    }
  }
}

provider "docker" {

}

resource "docker_network" "app_net" {
  name = "app_net"
}

resource "docker_network" "persistence_net" {
  name = "persistence_net"
}

resource "docker_network" "monitor_net" {
  name = "monitor_net"
}