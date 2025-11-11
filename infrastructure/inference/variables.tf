variable "kubeconfig_path" {
  type        = string
  description = "Path to kubeconfig file"
}

variable "host_ip" {
  type        = string
  description = "machine ip where cluster is running"
}

variable "inference_port" {
  type        = number
  description = "port on which inference model serving is listenning"
}

variable "model" {
  description = "The name of the model to call"
  type        = string
}

variable "prompt" {
  description = "The sample inputs payload or prompt for the model"
  type        = map(string)
}

variable "max_tokens" {
  type        = number
  description = "Max number of tokens in response"
}

variable "model_storage_size" {
  type        = string
  description = "size of pv holding model"
}

variable "text2image_model" {
  description = "model to be used to base images"
  type        = string
}

variable "text2image_port" {
  type        = number
  description = "port on which text2image model serving is listenning"
}

variable "node_name" {
  type        = string
  description = "name of node to set up storage pv"
}