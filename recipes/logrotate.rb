Chef::Log.info("updating logratoate configuration...")

cookbook_file "rabbitmq-server" do
  path "/etc/logrotate.d/rabbitmq-server"
  action :create
end