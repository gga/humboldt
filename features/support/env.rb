require_relative '../../lib/humboldt'

After do |scenario|
  @server.stop! if @server
end
