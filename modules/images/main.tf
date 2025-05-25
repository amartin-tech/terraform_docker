variable "name" {
  type = string
}

variable "image" {
  type = string
}

resource "docker_image" "this" {
  name = var.image
}

output "image_id" {
    value = docker_image.this.id
  description = "ID of the Docker image"
}
