
resource "aws_vpn_connection" "vpn-tunnel-secprj" {
	customer_gateway_id = "cgw-0d2f6e3ed1869f251"
	vpn_gateway_id = "vgw-0f9f86816de4229f6"
	type = "ipsec.1"
	static_routes_only = true

	tags = {
		Name = "vpn-tunnel-secprj"
	}
}
