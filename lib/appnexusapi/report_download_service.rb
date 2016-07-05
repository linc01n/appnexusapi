class AppnexusApi::ReportDownloadService < AppnexusApi::Service
  def get(params={})
    return_response = params.delete(:return_response) || false
    response = CSV.parse(@connection.get(uri_suffix, {}).body)
  end
end
