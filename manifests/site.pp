node default {
	notify {'Hello from Puppet Server!':}
}

# node <agent_hostname>
node myagent {
	notify {'I am a Muppet!':}
	include muppet
	include muppet::peggy
}


# node 

