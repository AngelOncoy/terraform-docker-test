variable "env_prefix" {
  description = "Prefijo de entorno"
  type        = string
  default     = "dev"
}

variable "grafana_port" {
  description = "Puerto publicado para Grafana"
  type        = number
  default     = 3000
}

variable "grafana_admin_user" {
  type    = string
  default = "admin"
}

variable "grafana_admin_password" {
  type      = string
  sensitive = true
  default   = "admin" # cámbiala en cuanto puedas
}
