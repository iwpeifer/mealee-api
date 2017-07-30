require 'rest-client'

class DataController < ApplicationController

  def retrieve
    url = "https://api.yelp.com/v3/businesses/search?location=#{params[:location]}&term=#{params[:term]}&limit=#{params[:limit]}"
    begin
      data = RestClient.get(url, headers={
        'Authorization': ENV['BEARER_TOKEN']
      })
      byebug
    rescue RestClient::ExceptionWithResponse => e
      # data is being redefined only if there is an error
      data = e.response
    end
    render json: data
  end

end
