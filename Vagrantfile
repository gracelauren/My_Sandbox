Vagrant::Config.run do |config|
  config.vm.define :djangovm do |django_config|
    django_config.vm.box = "ubuntu/trusty64"

    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    django_config.vm.box_url = "http://files.vagrantup.com/ubuntu/trusty64.box"

    # Forward a port from the guest to the host, which allows for outside
    # computers to access the VM, whereas host only networking does not.
    django_config.vm.forward_port 80, 8080
    django_config.vm.forward_port 8000, 8001
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
    django_config.vm.synced_folder "./", "/var/www", create: true, group: "www-data", owner: "www-data"

    # Enable provisioning with chef solo, specifying a cookbooks path (relative
    # to this Vagrantfile), and adding some recipes and/or roles.
    #
    django_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "apt"
      chef.add_recipe "apache2::mod_wsgi"
      chef.add_recipe "build-essential"
      chef.add_recipe "git"
      chef.add_recipe "vim"
    #
    #   # Can specify custom JSON attributes here:
    #   chef.json = { :mysql_password => "foo" }
    end
    django_config.vm.provision "shell", path: "provision/setup.sh"
  end
end
