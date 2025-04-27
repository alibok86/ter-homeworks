resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}
resource "yandex_compute_instance" "platform" {
  name        = "vm-web-${local.vm_web_name}"
  platform_id = var.vm_web_instance_name_platform_id
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
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh-keys
  }
}

####################### VM2

resource "yandex_vpc_network" "develop2" {
  name = var.vpc_name_db
}
resource "yandex_vpc_subnet" "develop2" {
  name           = var.vm_db_instance_name
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop2.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu2" {
  family = var.vm_db_image_family
}
resource "yandex_compute_instance" "platform2" {
  name        = local.vm_db_name
  platform_id = var.vm_db_istance_platformid
  zone        = var.vm_db_zone
  allow_stopping_for_update = true
  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop2.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh-keys
  }

}
