resource "aws_key_pair" "vasu" {
key_name = "mykey"
public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
output "keyname" {
value = "${aws_key_pair.vasu.fingerprint}"
}
