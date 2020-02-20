node default {
	notify {'Hello from Puppet Server!':}
}

# node <agent_hostname>
node myagent {
	notify {'Ich bin ein Muppet!':}
	include muppet
	include muppet::peggy
}


# node 

