Chef::Log.info("setting jobaline rabbitmq cluster...")

rabbitmq_layer = node['rabbitmq']['opsworks']['layer_name']
Chef::Log.info(rabbitmq_layer)

instances = node[:opsworks][:layers][rabbitmq_layer][:instances]

rabbit_nodes = instances.map{ |name, attrs| "rabbit@#{name}" }
node.set['rabbitmq']['cluster_disk_nodes'] = rabbit_nodes

# Need to reset for clustering #
execute 'reset-node' do
  Chef::Log.info("resetting rabbitmq node...")
  command 'rabbitmqctl stop_app && rabbitmqctl reset && rabbitmqctl start_app'
  action :nothing
end
