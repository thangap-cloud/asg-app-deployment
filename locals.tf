locals{
  subnet_ids_list = tolist(data.aws_subnet_ids.subnet-ids.ids)
}
