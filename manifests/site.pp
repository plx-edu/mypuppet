node default {
	notify {'Hello from Puppet Server!':}
}

# node <agent_hostname>
node myagent {
	notify {'Ich bin ein Muppet! (bis)':}
	include muppet
	include muppet::peggy
}


# node 

