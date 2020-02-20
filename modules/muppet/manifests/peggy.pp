# class 
class muppet::peggy {
	# creation user "peggy"
	user { 'peggy':
	        ensure => 'present',
	        shell => '/bin/bash',
	        home => '/home/peggy',
	        gid => 'peggy',
	        require => Group['peggy'],
	        before => File['/home/peggy'],
	}

	group { 'peggy':
	        ensure => 'present',
	}


	file { '/home/peggy':
	        #path => '/home/peggy',
	        ensure => 'directory',
	        owner => 'peggy',
	        group => 'peggy',
	        before => File['/home/peggy/.profile'],
	}


	file { '/home/peggy/.profile':
	        #path => '/home/peggy/.profile',
	        ensure => 'file',
	        content => 'echo "I was created by puppet, signed Peggy"',
	        owner => 'peggy',
	        group => 'peggy',
	}
}

