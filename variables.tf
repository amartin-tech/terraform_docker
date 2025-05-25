variable "docker_host" {
  description = "Hôte Docker (ex: unix:///var/run/docker.sock ou tcp://IP:2375)"
  type        = string
  default     = "unix:///var/run/docker.sock"
}

