## Single Page Apps - Part1: Popular Client Side MVC Frameworks

Based on the number of people who starred the Github repositores, we get the following top JavaScript client side MVC frameworks:

### JavaScript MVC Framwork Rankings

1. Angular (18562)
2. Backbone (16651)
3. Ember (9022)
4. Flight (4655)
5. Knockout (4487)
6. Marionette (4261)
7. React (3688)
8. Polymer (3108)
9. Spine (2489)
10. Sammy (2388)
11. Enyo (1657)
12. Batman (1568)

Notice that if we count the Backbone extension frameworks like Marionette(4248), Chaplin(2476), and Thorax(1093), Backbone is still #1.  But it looks like Angular is growing at a faster rate than others and should surprise the Backbone+extension total at some point.

I wrote this little app using Rails 4, Twitter Bootstrap, and MongoDB/Mongoid to track the rankings of those frameworks, see the screen shot below. If you are interested, feel free to clone the repo [https://github.com/tomz/jsmvc_rankings](https://github.com/tomz/jsmvc_rankings) and play with it, you can run the rake tasks to initialize and fetch the latest stats from github:

    rake rake seed_stats
 
    rake update_stats
    

The rake task can be set up as a daily cron job to collect the trending data of each framework.

![link to the ranking app screen shot](https://raw.github.com/tomz/jsmvc_rankings/master/public/top_jsmvc_frameworks-2014-01-01.png)

JS Framework tracking app [https://github.com/tomz/jsmvc_rankings](https://github.com/tomz/jsmvc_rankings)

*note that the term MVC is used loosely here to include all the MV\* frameworks*

In part 2 to 4 of this SPA series, we will walk through building a SPA app using Backbone Marionette, Angular, and Ember.

### Resource Links:

Angular [https://github.com/angular/angular.js](https://github.com/angular/angular.js)  
Backbone [https://github.com/jashkenas/backbone](https://github.com/jashkenas/backbone)  
Ember [https://github.com/emberjs/ember.js](https://github.com/emberjs/ember.js)  
Flight [https://github.com/flightjs/flight](https://github.com/flightjs/flight)  
Knockout [https://github.com/flightjs/flight](https://github.com/knockout/knockout)  
Marionette [https://github.com/marionettejs/backbone.marionette](https://github.com/marionettejs/backbone.marionette)  
React [https://github.com/facebook/react](https://github.com/facebook/react)  
Polymer [https://github.com/polymer/polymer](https://github.com/polymer/polymer)  
Spine [https://github.com/spine/spine](https://github.com/spine/spine)  
Sammy [https://github.com/quirkey/sammy](https://github.com/quirkey/sammy)  
Enyo [https://github.com/enyojs/enyo](https://github.com/enyojs/enyo)  
Batman [https://github.com/batmanjs/batman](https://github.com/batmanjs/batman)  

TodoMVC [http://todomvc.com/](http://todomvc.com/)
