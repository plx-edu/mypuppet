node default {
	notify {'Hello from Puppet Server!':}
}

# node <agent_hostname>
node myagent, agentclone1 {
	notify {'Ich bin ein Muppet! (bis)':}
	class { 'muppet':
		$myvar = "florian"
	}
}


# node 

