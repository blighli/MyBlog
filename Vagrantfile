Vagrant.configure(2) do |config|
    
    config.vm.box = "ubuntu/trusty64"

	config.vm.network "forwarded_port", guest: 5000, host: 5000

	config.vm.provision "shell", inline: <<-SHELL
		sudo apt-get update
		sudo apt-get install -y python-pip
		cd /vagrant
		pip install -r requirements.txt
		python manage.py db upgrade
		python manage.py runserver -h 0.0.0.0 -p 5000
	SHELL
end