class GithubProfilesController < ApplicationController
  def index
    profile = Faraday.get("https://github.com/pgeliebter").body
    render json: profile
  end
end
