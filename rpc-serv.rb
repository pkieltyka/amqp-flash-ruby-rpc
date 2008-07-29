require 'rubygems'
require 'mq'
require 'json'

EM.run do

  def log(*args)
    p args
  end
  
  amq = MQ.new
  rpcx = amq.direct("rpcx")

  amq.queue("serv", :auto_delete => true).bind(rpcx, :routing_key => "serv").subscribe do |info, msg|
    log :recv, msg
    amq.queue(info.reply_to).publish({ :response => msg }.to_json, :correlation_id => info.correlation_id)
  end

end
