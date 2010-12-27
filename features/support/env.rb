$: << File.dirname(__FILE__) + '/../../src'

require 'server'
require 'script'
require 'report'

After do |scenario|
  @server.stop! if @server
end