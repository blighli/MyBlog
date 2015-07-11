Vagrant.configure(2) do |config|
    
    config.vm.box = "ubuntu/trusty64"

    config.vm.box_check_update = false

    config.vm.hostname = "MyBlogServer"

	config.vm.network "forwarded_port", guest: 5000, host: 5000

	config.vm.provision "shell", inline: <<-SHELL
		sudo echo "deb http://mirrors.aliyun.com/ubuntu trusty main universe" > /etc/apt/sources.list
		sudo apt-get update
		sudo apt-get install -y python-pip
	SHELL
end