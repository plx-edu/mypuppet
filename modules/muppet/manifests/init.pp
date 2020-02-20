# class 
class muppet {
	# creation user "kermit"
	user { 'kermit':
	        ensure => 'present',
	        shell => '/bin/bash',
	        home => '/home/kermit',
	        gid => 'kermit',
	        require => Group['kermit'],
	        before => File['/home/kermit'],
	}

	group { 'kermit':
	        ensure => 'present',
	}


	file { '/home/kermit':
	        #path => '/home/kermit',
	        ensure => 'directory',
	        owner => 'kermit',
	        group => 'kermit',
	        before => File['/home/kermit/.profile'],
	}


	file { '/home/kermit/.profile':
	        #path => '/home/kermit/.profile',
	        ensure => 'file',
	        #content => 'echo "I was created by puppet, signed Kermit"',

					# puppet va chercher automatiquement dans le dossier "files"
					source => 'puppet:///modules/muppet/.profile',
	        owner => 'kermit',
	        group => 'kermit',
	}
}

