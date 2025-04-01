variable "eip_tag" {
  type = map 
  default = {
    Name = "eip"
  }
  description = "The tag for the elastic ip"
}
