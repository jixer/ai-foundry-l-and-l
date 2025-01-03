variable "sub" {
  type        = string
  description = "(Required) Target Azure subscription ID"
}

variable "name_prefix" {
  type        = string
  description = "(Required) specify a unique name to be used for all resources created by this template"
}

variable "owner" {
  type        = string
  description = "(Required) Email address to associate resources to via tagging"
}

variable "location" {
  type        = string
  description = "(Required) Azure region to deploy to. Default is East US"
  default     = "eastus"
}

variable "environment" {
  type        = string
  description = "A name for this environment; defaults to 'poc'"
  default     = "poc"
}