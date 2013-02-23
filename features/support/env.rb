$: << File.dirname(__FILE__) + '/../../lib'

require 'server'
require 'script'
require 'report'
require 'repository'

After do |scenario|
  @server.stop! if @server
end
