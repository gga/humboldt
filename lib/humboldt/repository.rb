require 'rinda/tuplespace'

module Humboldt

  class Repository
    def initialize(url)
      @service = DRbObject.new_with_uri(url)
    end

    def time(tag, label, *data)
      @service.write [tag, label] + data
    end
  end

end
