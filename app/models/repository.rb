require 'open-uri'

class Repository
  include Mongoid::Document
  include Mongoid::Timestamps

  field :url, type: String
  field :name, type: String
  field :description, type: String
  field :stars, type: Integer
  field :forks, type: Integer
  field :commits, type: Integer
  field :authors, type: Integer
  field :issues, type: Integer
  
  has_many :stats_logs

  index({ name: 1 }, { unique: false, name: "repository_name_idx" })
  index({ stars: -1 }, { unique: false, name: "repository_stars_idx" })
  
  def self.scrape_stats url
    user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/53 (KHTML, like Gecko) Chrome/15.0.87'
    doc = Nokogiri::HTML(open(url,"User-Agent" => "#{user_agent}").read)
    name_github = url.split('/').last.strip
    if name_github == "backbone.marionette"
      name = "marionette"
    else
      name = name_github.split(".").first
    end
    desc = doc.at_css('div.repository-description').text.strip rescue ""
    social_el = doc.css("ul.pagehead-actions li a.social-count")
    stars = social_el[0].text.strip.gsub(',','')
    forks = social_el[1].text.strip.gsub(',','')
    summary_el = doc.css("ul.numbers-summary li span.num")
    commits = summary_el[0].text.strip.gsub(',','')
    authors = summary_el[3].text.strip.gsub(',','')
    issues = doc.css("li span.counter")[0].text.strip
    stats = {
      name: name, url: url, description: desc,
      stars: stars, forks: forks.to_i, commits: commits.to_i, authors: authors.to_i, issues: issues.to_i
    }
    puts stats
    stats
  end
    
end
