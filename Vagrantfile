Vagrant.configure(2) do |config|
    
    config.vm.box = "ubuntu/trusty64"

	config.vm.network "forwarded_port", guest: 5000, host: 5000

	config.vm.provision "shell", inline: <<-SHELL
		sudo apt-get update
		sudo apt-get install -y python-pip
		pip install -r /vagrant/requirements.txt
		python /vagrant/manage.py db upgrade
		python /vagrant/manage.py runserver -h 0.0.0.0 -p 5000
	SHELL
end