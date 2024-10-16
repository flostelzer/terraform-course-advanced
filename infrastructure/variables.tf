variable "provider_azurerm_subscription_id" {
  type        = string
  description = "This is the target subscription Id where resources are deployed."
  default     = "da12d467-03ae-4675-aa29-d3b26fdbd2cc"
}
variable "workload_name" {
  type        = string
  description = "This defines the workload name used for the resources."
  default     = "tfschool"
}

variable "workload_name_short" {
  type        = string
  description = "This defines the workload name used for the resources."
  default     = "tfs"
}

variable "env" {
  type        = string
  description = "This defines the environment where resources are deployed."
  default     = "dev"
}

variable "env_short" {
  type        = string
  description = "This defines the environment short where resources are deployed."
  default     = "d"
}

variable "location" {
  type        = string
  description = "This defines the location, where Azure resources are deployed."
  default     = "switzerlandnorth"
}

variable "location_short" {
  type        = string
  description = "This defines the location in short, where Azure resources are deployed."
  default     = "chn"
}

variable "workload_instance" {
  type        = number
  description = "This defines the instance number for the workload."
  default     = "1"
}

variable "workload_context_as_object" {
  type = object({
    name     = string
    env      = string
    location = string
    instance = number
  })
  description = "This defines all workload parameters in an object."
  default = {
    name     = "tfschool"
    env      = "dev"
    location = "switzerlandnorth"
    instance = "1"
  }
}

variable "vnet_range" {
  type        = string
  description = "This defines the range of the vnet."
  default     = "10.0.0.0/16"
}

variable "subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
  description = "This defines the names and address prefixes of the subnets."
}

variable "subnet_range_firewall" {
  type = string
  description = "This defines the subnet range for the firewall subnet."
}

variable "firewall_rules" {
  type = list(object({
    name             = string
    source_addresses = list(string)
    target_fqdns     = list(string)
    protocols = list(object({
      port = string
      type = string
    }))
  }))
}

variable "security_tags" {
  type        = map(string)
  description = "This defines the security tags, which are needed to deploy resources to ipt tenant."
  default = {
    SecfixOwner            = "florian.stelzer@ipt.ch"
    SecfixNonProd          = "true"
    SecfixNoAlert          = "true"
    SecfixContainsUserData = "false"
    SecfixContainsEPHI     = "false"
    SecfixDescription      = "non-productive and non-sensitive workloads"
    expireOn               = "2024-10-30"
  }
}