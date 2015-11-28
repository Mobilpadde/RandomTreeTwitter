var exec = require("child_process").exec,
    fs = require("fs"),
    Twit = require("twit"),
    config = require("./config.json");

var twitter = new Twit({
    consumer_key: config.consumerKey,
    consumer_secret: config.consumerSecrect,
    access_token: config.accessToken,
    access_token_secret: config.accessTokenSecret
});

var stream = twitter.stream("user");
console.log("Up 'n running!");

stream.on("tweet", function(msg){
    var users = msg.text.match(/@[a-z0-9]+\b/gi);
    if(users.indexOf(msg.user.screen_name) < 0) users.push("@" + msg.user.screen_name);
    //if(users.indexOf("@TreesAreRandom") > -1) users.splice(users.indexOf("TreesAreRandom"), 1); -- Fix
    if((users.indexOf("TreesAreRandom") || users.indexOf("treesarerandom")) && msg.user.screen_name != "TreesAreRandom"){
        exec("~/programs/RandomTreeTwitter/./RandomTreeTwitter", function(erro, stdout, stderr){
            fs.readFile("/root/programs/RandomTreeTwitter/tree.png", "base64", function(err, data){
                twitter.post("media/upload", { media_data: data }, function(err, data, response){
                    var id = data.media_id_string,
                        usersText = "";

                    for(var i in users) usersText += " " + users[i];

                    twitter.post("statuses/update", {
                        status: "Here we go," + usersText + "!",
                        media_ids: [id]
                    }, function(erro, data){
                        console.log("Tweet");
                    });
                });
            });
        });
    }
});
