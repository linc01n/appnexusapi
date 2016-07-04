class AppnexusApi::ReportService < AppnexusApi::Service
  def create(attributes={})
    raise(AppnexusApi::NotImplemented, "Service is read-only.") if @read_only
    attributes = { name => attributes }
    response = JSON.parse(@connection.post(uri_suffix, attributes).body)['response']
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
    response = JSON.parse(@connection.get(uri_suffix, params).body)['response']
  end
end
