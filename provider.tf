terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }

}

provider "docker" {
  host = var.docker_host
}
