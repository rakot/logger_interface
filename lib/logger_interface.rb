require "logger_interface/version"
require 'active_support/all'
require 'json'
require 'curb'

module LoggerInterface
  # Your code goes here...
  extend self

  def init(url,silent)
    @url = url
    @silent = silent
  end

  def log(app,warn,message)
    if @silent
      begin
        internal_log(app,warn,message)
      rescue
        false
      end
    else
      internal_log(app,warn,message)
    end
  end

  def get_last_error
    @last_error
  end

  private
  def internal_log(app,warn,message)
    curl = Curl::Easy.new(@url)
    curl.post_body = {app:app,warn:warn,message:message}.to_query
    curl.http(:GET)

    result = JSON.parse(curl.body_str)

    if result.is_a?(Hash) and result['status'].present? and result['status'] == 'success' then
      true
    else
      if result.is_a?(Hash) and result['error'].present?
        @last_error = result['error']
      end
      false
    end
  end

end
