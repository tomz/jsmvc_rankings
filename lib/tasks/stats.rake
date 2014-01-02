desc "seed mongodb with the git repo stats"
task :seed_stats => :environment do
  seed_stats
end

desc "update mongodb with the git repo stats"
task :update_stats => :environment do
  update_stats
end

def seed_stats

  urls = [
    "https://github.com/jashkenas/backbone",
    "https://github.com/angular/angular.js",
    "https://github.com/emberjs/ember.js",
    "https://github.com/flightjs/flight",
    "https://github.com/knockout/knockout",
    "https://github.com/marionettejs/backbone.marionette",
    "https://github.com/facebook/react",
    "https://github.com/polymer/polymer",
    "https://github.com/spine/spine",
    "https://github.com/quirkey/sammy",
    "https://github.com/enyojs/enyo",
    "https://github.com/batmanjs/batman"
  ]

  urls.each {|url|
    stats = Repository.scrape_stats(url)
    Repository.create(stats)
    sleep 0.5
  }

end

def update_stats

  Repository.each {|repo|
    stats = Repository.scrape_stats(repo.url)
    repo.stars = stats[:stars]
    repo.forks = stats[:forks]
    repo.commits = stats[:commits]
    repo.authors = stats[:authors]
    repo.issues = stats[:issues]
    repo.save
    StatsLog.create(
      repository_id: repo.id,
      stars: repo.stars,
      forks: repo.forks,
      commits: repo.commits,
      authors: repo.authors,
      issues: repo.issues
    )
    sleep 0.5
  }

end
