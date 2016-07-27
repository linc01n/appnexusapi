class AppnexusApi::ReportService < AppnexusApi::Service
  def create(attributes={})
    raise(AppnexusApi::NotImplemented, "Service is read-only.") if @read_only
    attributes = { name => attributes }
    response = @connection.post(uri_suffix, attributes).body
    response = JSON.parse(response)['response'] if response.is_a?(String)
    if response['error_id']
      response.delete('dbg')
      raise AppnexusApi::BadRequest.new(response.inspect)
    end
    response
  end

  def get(params={})
    return_response = params.delete(:return_response) || false
    params = {
      "num_elements" => DEFAULT_NUMBER_OF_ELEMENTS,
      "start_element" => 0
    }.merge(params)
    response = @connection.get(uri_suffix, params).body
    response = JSON.parse(response)['response'] if response.is_a?(String)
  end
end
