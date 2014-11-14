# Cookbook Name:: rails_book_cookbook
# Recipe:: dotenv

directory '/var/www/awesome-events/shared' do
  owner 'ops'
  action :create
end

cookbook_file '/var/www/awesome-events/shared/.env.staging' do
  owner 'ops'
  action :create
end
