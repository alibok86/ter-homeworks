###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = "b1gtop2jhkqm3tje2502"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1ga5vid7asgu0mic59u"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vpc_name_db" {
  type        = string
  default     = "develop2"
  description = "VPC network & subnet name"
}

variable "vms_resources" {
  type = map(object({
    cores = number
    memory  = number
    core_fraction = number
  }))
}
variable "metadata" {
  type = object({
    serial-port-enable = number
    ssh-keys           = string
  })
  description = "Общие метаданные для всех виртуальных машин"
  }

###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
# default     = "~/.ssh/id_ed25519.pub"
# description = "ssh-keygen -t ed25519"
#}