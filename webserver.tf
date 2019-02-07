/**module "keypair"  {
source = "/home/sample/vpc/modules/keypair"
}**/
resource "aws_key_pair" "vasu" {
key_name = "vasu"
public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "webserver" {
  ami = "${lookup(var.AMIS,var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.vasu.key_name}"
}
/**
  provisioner "local-exec" {
    command = "ansible-playbook -u ec2-user  -i '${self.public_ip},' --private-key ${var.PATH_TO_PRIVATE_KEY} ../../apache.yml" 
  }
  connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
**/


