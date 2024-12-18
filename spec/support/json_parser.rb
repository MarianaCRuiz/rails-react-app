module JsonParser
  def parsed_body
    JSON.parse(response.body, symbolize_names: true)
  end

  def deep_symbolize_parsed_body
    JSON.parse(response.body).deep_symbolize_keys
  end
end
