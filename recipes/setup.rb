Chef::Log.info("EXECUTING setup")

# Add User #
execute 'create-user' do
  Chef::Log.info("creating user...")
  user = node['rabbitmq']['user']
  pass = node['rabbitmq']['pass']
  cmd = 'rabbitmqctl add_user %s %s && rabbitmqctl set_user_tags %s administrator && rabbitmqctl set_permissions -p / %s ".*" ".*" ".*"' % [user,pass,user,user]
  Chef::Log.info(cmd)
  command cmd
  action :nothing
end


execute 'create-queues' do
  Chef::Log.info("creating queues...")
  action :nothing
end

