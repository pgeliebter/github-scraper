class GithubProfilesController < ApplicationController
  def index
    commits = GithubProfileScraper.new

    render json: { this_year_commits: commits.this_year_commits, last_week_commits: commits.last_week_commits, this_week_commits: commits.this_week_commits, todays_commits: commits.todays_commits }
  end
end
