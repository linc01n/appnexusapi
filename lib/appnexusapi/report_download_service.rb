class AppnexusApi::ReportDownloadService < AppnexusApi::Service
  def get(params={})
    require 'csv'
    return_response = params.delete(:return_response) || false
    response = ::CSV.parse(@connection.get(uri_suffix, params).body)
  end
end
