class configs::resolv_conf {
	if dns_server in $roles {
		$ns1 = "127.0.0.1"
	}

	file{ "resolv.conf":
		path	=> "/etc/resolv.conf",
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> "0644",
		content	=> template("configs/etc/resolv.conf.erb"),
	}
}
