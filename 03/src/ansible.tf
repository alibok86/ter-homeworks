resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/ansible_inventory.tftpl", {
    webservers = [
      for vm in yandex_compute_instance.web : {
        name                = vm.name
        network_interface  = vm.network_interface
        fqdn              = try(vm.hostname, "${vm.fqdn}.auto.internal")
      }
    ],
    databases = [
      for vm in yandex_compute_instance.db : {
        name                = vm.name
        network_interface  = vm.network_interface
        fqdn              = try(vm.hostname, "${vm.fqdn}.auto.internal")
      }
    ],
    storage = [
      {
        name                = yandex_compute_instance.storage.name
        network_interface  = yandex_compute_instance.storage.network_interface
        fqdn               = try(yandex_compute_instance.storage.hostname, "${yandex_compute_instance.storage.fqdn}.auto.internal")
      }
    ]
  })
  filename = "${path.module}/inventory.ini"
}