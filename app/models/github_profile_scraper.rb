require "nokogiri"
require "open-uri"

class GithubProfileScraper
  def initialize
    github_url = "https://github.com/pgeliebter"
    html = URI.open(github_url)
    @doc = Nokogiri::HTML(html)
  end

  def this_year_commits
    year_commits = @doc.css("h2.f4.text-normal.mb-2").text.match(/\b\d+\b/)[0].to_i
  end

  def this_week_commits
    this_week_commits = @doc.css(".js-calendar-graph-svg").css("g").css("g")[-1].css("rect").reduce(0) { |sum, day|
      sum + day.attributes["data-count"].value.to_i
    }
  end

  def last_week_commits
    last_week_commits = @doc.css(".js-calendar-graph-svg").css("g").css("g")[-2].css("rect").reduce(0) { |sum, day|
      sum + day.attributes["data-count"].value.to_i
    }
  end

  def todays_commits
    todays_commits = @doc.css(".js-calendar-graph-svg").css("g").css("g")[-1].css("rect").find { |day| day.attributes["data-date"].value == Date.today.strftime("%Y-%m-%d") }.attributes["data-count"].value.to_i
  end
end
