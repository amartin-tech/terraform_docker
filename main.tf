locals {
  # Images
  image_files = fileset("${path.module}/configs/images", "*.yaml")
  images = {
    for file in local.image_files :
    "${yamldecode(file("${path.module}/configs/images/${file}")).image}" =>
    yamldecode(file("${path.module}/configs/images/${file}"))
  }

  # Containers
  container_files = fileset("${path.module}/configs/containers", "*.yaml")
  containers = {
    for file in local.container_files :
    "${yamldecode(file("${path.module}/configs/containers/${file}")).name}" =>
    yamldecode(file("${path.module}/configs/containers/${file}"))
  }
}

module "images" {
  for_each = local.images

  source = "./modules/images"
  name   = each.key
  image  = each.value.image
}

module "containers" {
  for_each = local.containers

  source = "./modules/containers"
  name   = each.key
  image  = each.value.image
  ports  = each.value.ports
  depends_on = [module.images]
}