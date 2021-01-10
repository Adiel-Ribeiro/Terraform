provider "aws"                          {
  region                                =     "us-east-1"
  shared_credentials_file               =     "/data/it/terraform/proj1/.cred"
  profile                               =     "default"
}

resource "aws_instance" "sre"           {
 ami                                    =      "ami-00459894871b57743"
 instance_type                          =      "t3.micro"
 vpc_security_group_ids                 =       ["sg-0dec897a4ea5e82e9"]
 subnet_id                              =      "subnet-0cf9ab75f0a689cf3"
 associate_public_ip_address            =      "1"
 iam_instance_profile                   =      "ecsInstanceRole" 
 cpu_core_count                         =      "1" 
 cpu_threads_per_core                   =      "2" 
 instance_initiated_shutdown_behavior   =      "stop"
 disable_api_termination                =      "0"
 monitoring                             =      "0" 
 tenancy                                =      "default"
# user_data                              =      "${file("file.sh")}"
 availability_zone                      =      "us-east-1a"
 key_name                               =      "nuvym" 

root_block_device                       { 
 volume_size                            =      "30"
 delete_on_termination                  =      "1" 
 encrypted                              =      "0" 
# kms_key_id                            = 
}

volume_tags                             =       {
  Name                                  =       "sre"
} 

tags                                    =       {
 Name                                   =       "sre"
} 

}

