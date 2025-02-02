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

variable "app_size" {
  type        = string
  description = "The tier to use for the app service plan (defaults to B1)"
  default     = "B1"
}

variable "search_tier" {
  type        = string
  description = "The tier to use for the AI Search services (defaults to 'free'; other options are 'basic', 'standard')"
  default     = "free"
}