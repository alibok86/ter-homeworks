output "vm_web_info" {
  description = "WEB info"
  value = {
    instance_name = yandex_compute_instance.platform.name
    external_ip   = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    fqdn          = yandex_compute_instance.platform.fqdn
  }
}

output "vm_db_info" {
  description = "DB info"
  value = {
    instance_name = yandex_compute_instance.platform2.name
    external_ip   = yandex_compute_instance.platform2.network_interface.0.nat_ip_address
    fqdn          = yandex_compute_instance.platform2.fqdn
  }
}