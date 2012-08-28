class StaticController < ApplicationController

  def index
    @commands = Command.includes(:user).all
    @users = User.all
  end

  def engine
    files = [
      "javascript:",
      File.open(Rails.root + "public/locomotive.js").read,
      File.open(Rails.root + "public/zepto.min.js").read,
      File.open(Rails.root + "public/caboose.js").read,
    ]
    url = "#{request.protocol}#{request.host_with_port}/exec/%s?v=1.0"
    render :js => files.join(";\n\n").gsub(':queriac_url',url)
  end

end
