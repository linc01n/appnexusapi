class AppnexusApi::ReportDownloadService < AppnexusApi::Service
  def get(params={})
    return_response = params.delete(:return_response) || false
    params = {
      filename: "report_#{Time.now.strftime("%Y-%m-%d-%H-%M")}.csv"
    }.merge(params)

    # Download CSV file
    File.open(params[:filename], "wb"){ |fp| fp.write(@connection.get(uri_suffix, params).body)}
    response = @connection.get(uri_suffix, params)
  end
end
