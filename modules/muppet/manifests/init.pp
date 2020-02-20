# class 
class muppet {
	$varmuppet = ""

	# creation user "$varmuppet"
	user { '$varmuppet':
	        ensure => 'present',
	        shell => '/bin/bash',
	        home => '/home/$varmuppet',
	        gid => '$varmuppet',
	        require => Group['$varmuppet'],
	        before => File['/home/$varmuppet'],
	}

	group { '$varmuppet':
	        ensure => 'present',
	}


	file { '/home/$varmuppet':
	        #path => '/home/$varmuppet',
	        ensure => 'directory',
	        owner => '$varmuppet',
	        group => '$varmuppet',
	        before => File['/home/$varmuppet/.profile'],
	}


	file { '/home/$varmuppet/.profile':
	        #path => '/home/$varmuppet/.profile',
	        ensure => 'file',
	        #content => 'echo "I was created by puppet, signed $varmuppet"',

					# puppet va chercher automatiquement dans le dossier "files"
					source => 'puppet:///modules/muppet/.profile',
	        owner => '$varmuppet',
	        group => '$varmuppet',
	}
}

