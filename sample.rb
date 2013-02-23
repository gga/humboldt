script do

  user :allocate, :times => 100 do
    response = nil
    task 'create-block' do
      response = token.post ...
    end
  
    doc = REXML::Document.new(response.body)
    key_uri = URI.parse(doc.elements["//key"].text).path
  
    task 'get-key' do
      @token.get key_uri
    end
  end
  
  user :consume, :times => 10 do
    ...
  end

end