locals {
    vm_db_name = "${var.vm_name_compute_resource}-${var.vm_db_prefix}"
    vm_web_name = "${var.vm_name_compute_resource}-${var.vm_web_prefix}"
}