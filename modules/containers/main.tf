resource "docker_container" "this" {
  name  = var.name
  image = var.image


  # Port mapping
  ports {
    internal = var.ports[0].internal
    external = var.ports[0].external
  }

  # Restart policy
  restart = "unless-stopped"
}
