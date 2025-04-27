variable "vm_web_image_family" {
  description = "Family of the image to use for VM"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "vm_web_instance_name" {
  description = "instance_name"
  type        = string
  default     = "netology-develop-platform-web"
}

variable "vm_web_instance_name_platform_id" {
  description = "instance_name_platform_id"
  type        = string
  default     = "standard-v3"
}

/*variable "vm_web_instance_cores" {
  description = "number of cores"
  type        = string
  default     = "2"
}

variable "vm_web_instance_core_fraction" {
  description = "number of cores_fraction"
  type        = string
  default     = "20"
}

variable "vm_web_instance_memory" {
  description = "number of memory in GB"
  type        = string
  default     = "1"
}*/

## Переменые для netology-develop-platform-db

variable "vm_db_image_family" {
  description = "Family of the image to use for VM"
  type        = string
  default     = "ubuntu-2204-lts"
}
variable "vm_db_instance_name" {
  description = "instance_name"
  type        = string
  default     = "netology-develop-platform-db"
}
/*variable "vm_db_instance_cores" {
  description = "number of cores"
  type        = string
  default     = "2"
}
variable "vm_db_instance_core_fraction" {
  description = "number of cores_fraction"
  type        = string
  default     = "20"
}
variable "vm_db_instance_memory" {
  description = "number of memory in GB"
  type        = string
  default     = "2"
}*/
variable "vm_db_zone" {
  description = "zone for VM"
  type        = string
  default     = "ru-central1-b"
}
variable "vm_db_istance_platformid" {
  description = "instance_name_platform_id"
  type        = string
  default     = "standard-v3"
}
variable "vm_name_compute_resource" {
  type        = string
  default     = "netology-develop-platform"
  description = "name for compute resourse"
}
variable "vm_db_prefix" {
  type        = string
  default     = "db"
  description = "prefix for compute resourse db"
}

variable "vm_web_prefix" {
  type        = string
  default     = "web"
  description = "prefix for compute resourse web"
}