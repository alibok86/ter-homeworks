resource "yandex_compute_disk" "volume" {
  count    = 3
  name     = "volume-${count.index}"
  size     = var.disk_size
}

  resource "yandex_compute_instance" "storage" {
  name        = var.single_name
  hostname    = "${var.single_name}.netology.ru"
  platform_id = var.platform_id
  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

 dynamic "secondary_disk" {
    for_each = "${yandex_compute_disk.volume.*.id}" 
   content {
     disk_id = secondary_disk.value
   }
  }

  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = local.ssh
  }
}