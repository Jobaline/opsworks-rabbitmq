Chef::Log.info("EXECUTING setup")

# Add User #
execute 'create-user' do
  Chef::Log.info("creating user...")
  user = node['rabbitmq']['user']
  pass = node['rabbitmq']['pass']
  cmd = 'rabbitmqctl add_user %s %s && rabbitmq set_user_tages %s administrator && rabbit rabbitmqctl set_permissions -p / %s ".*" ".*" ".*"' % [user,pass,user,user]
  command cmd
  action :nothing
end


execute 'create-queues' do
  Chef::Log.info("creating queues...")
  
end

