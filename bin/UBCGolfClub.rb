#!/usr/bin/env ruby

require 'rubygems'
require 'chatterbot/dsl'

#
# this is the script for the twitter bot UBCGolfClub
# generated on 2014-03-21 22:37:46 -0700
#

consumer_key 'Ab9FPHo898iYyNKvq7X5Sw'
consumer_secret 'dj4jtMnKwADSF1k5J6pPfWAl8QNavtnDyA2uBDC1fw'

secret 'qSvM6kSKwepuwV6SnEhXd6LWhXc2vCv9Y3DeS4xqkhBir'
token '409055265-dcQNKVZr77lf7EIos2bOj8846VAzzt1IDBVwLhxd'

# remove this to send out tweets
#debug_mode

# remove this to update the db
no_update
# remove this to get less output when running
#verbose

# here's a list of users to ignore
blacklist "abc", "def"

# here's a list of things to exclude from searches
exclude "hi", "spammer", "junk", "fuck", "bad", "terrible", "shitty", "screw", "wedding", "loser"

loop do

  search("vancouver golf", opts ={:lang => "en", :result_type => "popular"}) do |tweet|
     retweet(tweet[:id])
  end
  
  #puts "\n\n\n\n"
  
  
  search("pga tour", opts ={:lang => "en", :result_type => "popular"}) do |tweet|    
    #puts tweet[:from_user] 
     if tweet[:from_user] == "PGA TOUR"
       #puts tweet[:from_user]
       #puts "TRUE!!\n\n\n"
       #puts tweet[:text]
       retweet(tweet[:id])
     end
  end
  
  #puts "\n\n\n\n"

  # explicitly update our config
  update_config

  sleep 900
end

