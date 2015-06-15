Chef::Log.info("updating logrotate configuration...")

cookbook_file "rabbitmq-server" do
  path "/etc/logrotate.d/rabbitmq-server"
  action :create
end
