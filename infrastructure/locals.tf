locals {
  workload_context                  = "${var.workload_name}-${var.env}-${var.location_short}-${var.workload_instance}"
  workload_context_short            = "${var.workload_name_short}${var.env}${var.location_short}${var.workload_instance}"
  workload_context_workspaces       = "${var.workload_name}-${terraform.workspace}-${var.location_short}-${var.workload_instance}"
  workload_context_workspaces_short = "${var.workload_name_short}${terraform.workspace}${var.location_short}${var.workload_instance}"
}