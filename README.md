# RandomTreeTwitter
Generate random trees for tweets.

## How to?
It's really simple, actually. First generate an [app for Twitter](https://apps.twitter.com/) and fill out the config-file and **bam**, you're done!

If you run a server without a GUI, you'll have to install xvfb. On Ubuntu it's just:
* sudo apt-get install xvfb libxrender1 libxtst6 libxi6
* sudo Xvfb :1 -screen 0 720x640x24 & # or whatever resolution you want
* export DISPLAY=:1
* node server

## Something else?
What is you want to create something other than trees? Well, create something awesome (it has to be awesome) in processing and export as a linux program, or whatevs server os you're using, change the path for the program and the exported image and you're finished! It's as easy as that (Which is quite tough actually).
