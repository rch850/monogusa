#
# References:
# - http://rubysource.com/just-do-it-learn-sinatra-i/
# - http://www.sinatrarb.com/intro.html
# - http://slim-lang.com/
# - http://qiita.com/items/69333fc7f5e52deafbec
#

require "sinatra/base"
require "aws-sdk"
require "slim"

module Monogusa
  class App < Sinatra::Base
    enable :sessions
    set :session_secret, "3dA6r82zFi6HAIbCfBGMZCV88vsxJHM1"

    get "/" do
      if session[:access_key_id]
        @ec2 = AWS::EC2.new(:access_key_id => session[:access_key_id],
                           :secret_access_key => session[:secret_access_key])
        @s3 = AWS::S3.new(:access_key_id => session[:access_key_id],
                         :secret_access_key => session[:secret_access_key])
        slim :index
      else
        redirect to("/login")
      end
    end

    get "/login" do
      slim :login
    end

    post "/login" do
      session[:access_key_id] = params[:access_key_id]
      session[:secret_access_key] = params[:secret_access_key]
      redirect to("/")
    end

    get "/logout" do
      session.clear
      redirect to("/")
    end
  end
end

