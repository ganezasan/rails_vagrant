# Cookbook Name:: rails_book_cookbook
# Recipe:: nginx_setting

# include_recipe 'nginx'

directory '/var/www/awesome-events' do
  owner 'vagrant'
  action :create
  recursive true
end

template '/etc/nginx/sites-available/default' do
  action :create
  source "default.conf.erb"
  notifies :reload, 'service[nginx]'
end
