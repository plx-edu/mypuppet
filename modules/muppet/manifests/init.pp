# class 
class muppet($myvar) {

	# creation user "$myvar"
	user { "$myvar":
	        ensure => "present",
	        shell => "/bin/bash",
	        home => "/home/$myvar",
	        gid => "$myvar",
	        require => Group["$myvar"],
	        before => File["/home/$myvar"],
	}

	group { "$myvar":
	        ensure => "present",
	}


	file { "/home/$myvar":
	        #path => "/home/$myvar",
	        ensure => "directory",
	        owner => "$myvar",
	        group => "$myvar",
	        before => File["/home/$myvar/.profile"],
	}


	file { "/home/$myvar/.profile":
	        #path => "/home/$myvar/.profile",
	        ensure => "file",
	        #content => "echo "I was created by puppet, signed $myvar"",

					content => epp('muppet/.profile.epp', {
						myvar => "$myvar"
					}),

					# puppet va chercher automatiquement dans le dossier "files"
					# source removed for content (template)
					#source => "puppet:///modules/muppet/.profile",
	        owner => "$myvar",
	        group => "$myvar",
	}
}

