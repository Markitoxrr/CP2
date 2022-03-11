variable "vm_size"{
	type = string
	description = "Tamaño de la máquina virtual"
	default = "Standard_D1_v2" # 4 GB, 2 CPU
}

variable "vms" { #listado de maquinas virtuales a generar
	type = list(string)
	description = "Máquinas Virtuales"
	default = ["master", "worker01", "worker02", "nfs"]
}