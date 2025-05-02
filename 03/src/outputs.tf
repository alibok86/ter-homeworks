output "web_instances" {
  value = {
    for vm in yandex_compute_instance.web :
    vm.name => vm.network_interface.0.nat_ip_address
  }
}

output "db_instances" {
  value = {
    for vm in yandex_compute_instance.db :
    vm.name => vm.network_interface.0.nat_ip_address
  }
}

output "storage_instance" {
  value = yandex_compute_instance.storage.network_interface.0.nat_ip_address
}