# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "rails"

#  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 80, host: 3000
  config.vm.network :private_network, ip: "192.168.33.199"
  config.ssh.forward_agent = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./cookbooks", "./site-cookbooks"]

    chef.add_recipe 'build-essential'
    chef.add_recipe 'git'
    chef.add_recipe 'memcached'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'database'
    chef.add_recipe 'sqlite'
    chef.add_recipe 'xml'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::system'
    chef.add_recipe 'nginx'
    chef.add_recipe 'imagemagick'

    chef.add_recipe 'rails_book_cookbook::ops_user'
    chef.add_recipe 'rails_book_cookbook::keys'
    chef.add_recipe 'rails_book_cookbook::nginx_setting'
    chef.add_recipe 'rails_book_cookbook::sqlite3_dev'
    #chef.add_recipe 'rails_book_cookbook::iptables'
    #chef.add_recipe 'rails_book_cookbook::dotenv'

    chef.json = {
      rbenv: {
        user_installs: [{
          user: 'vagrant',
            rubies: [ "2.1.2" ],
            global: "2.1.2",
            gems: {
              "2.1.2" => [
              { name: "bundler" }
              ]
            }
        }]
      }
    }
  end
end
