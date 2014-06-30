(require 'newsticker)
(global-set-key (kbd "C-c r") 'newsticker-treeview)
(setq newsticker-html-renderer 'w3m-region)
'(newsticker-url-list
  (quote
   (("HMK's Spurious Thoughts" "http://www.spuriousthoughts.com/feed/atom/" nil nil nil)
    ("The Paleo Pair" "http://thepaleopair.tumblr.com/rss" nil nil nil)
    ("The NewsBlur Blog" "http://blog.newsblur.com/rss" nil nil nil)
    ("Tom Morris" "http://tommorris.org/posts.xml" nil nil nil)
    ("Less Wrong" "http://lesswrong.com/.rss" nil nil nil)
    ("A Life Less Bullshit" "http://feeds.feedburner.com/lifelessbullshit?format=xml" nil nil nil)
    ("Mostly Harmless" "http://robrhinehart.com/?feed=rss2" nil nil nil)
    ("Adam Prescott" "https://aprescott.com/feed" nil nil nil)
    ("Ben Werdmuller" "http://benwerd.com/feed/" nil nil nil)
    ("Comments on: Home" "http://www.alifeonyourterms.com/home/feed/" nil nil nil)
    ("The Pidgeonhole Principal" "http://joneisen.tumblr.com/rss" nil nil nil)
    ("Robert Heaton" "http://feeds.feedburner.com/RobertHeaton?format=xml" nil nil nil)
    ("Marco.org" "http://www.marco.org/rss" nil nil nil)
    ("Justin Vincent" "http://justinvincent.com/feed" nil nil nil)
    ("copyrighteous" "http://mako.cc/copyrighteous/feed" nil nil nil)
    ("SlashGeek" "http://www.slashgeek.net/feed/" nil nil nil)
    ("kyleisom.net" "http://www.kyleisom.net/feed.xml" nil nil nil)
    ("Emacs Redux" "http://emacsredux.com/atom.xml" nil nil nil)
    ("What the .emacs.d!?" "http://whattheemacsd.com/atom.xml" nil nil nil)
    ("Bapt" "http://blog.etoilebsd.net/index.atom" nil nil nil)
    ("Hile Household" "http://hilehousehold.squarespace.com/journal?format=rss" nil nil nil)
    ("Mostly Maths" "http://feeds.feedburner.com/MostlyMaths" nil nil nil)
    ("The Friendly Anarchist" "http://feeds.feedburner.com/FriendlyAnarchist" nil nil nil)
    ("plasticbag.org" "http://plasticbag.org/feed" nil nil nil)
    ("Mottr.am" "http://mottr.am/atom.xml" nil nil nil)
    ("Signal vs. Noise" "http://feeds.feedburner.com/37signals/beMH" nil nil nil)
    ("Andy Mangold on scriptogr.am" "http://feeds.feedburner.com/andymangold?format=xml" nil nil nil)
    ("The Buffer blog: productivity, life hacks, writing..." "http://feeds.feedburner.com/bufferapp" nil nil nil)
    ("Dustin Curtis" "http://feeds.feedburner.com/dcurtis" nil nil nil)
    ("Debu.gs" "http://feeds.feedburner.com/debugs" nil nil nil)
    ("Inside 206-105" "http://feeds.feedburner.com/ezyang" nil nil nil)
    ("Infotropism" "http://infotrope.net/feed/" nil nil nil)
    ("Startups, life, learning and happiness" "http://feeds.feedburner.com/joelis" nil nil nil)
    ("Tiny Buddha" "http://tinybuddha.com/feed/" nil nil nil)
    ("Raptitude.com" "http://feeds2.feedburner.com/Raptitudecom" nil nil nil)
    ("Tynan | Life Outside the Box" "http://feeds.feedburner.com/tynan?format=xml" nil nil nil)
    ("zenhabits" "http://zenhabits.net/feed/" nil nil nil)
    ("Lifehacker" "http://feeds.gawker.com/lifehacker/vip" nil nil nil)
    ("mnmlist" "http://mnmlist.com/feed/" nil nil nil)
    ("Nathan's Blog" "http://blog.nathantypanski.com/rss" nil nil nil)
    ("Lost in Technopolis" "http://newartisans.com/feed/" nil nil nil)
    ("Poly in Pictures" "http://www.polyinpictures.com/feed/" nil nil nil)
    ("Practically Efficient" "http://feeds.feedburner.com/PracticallyEfficient" nil nil nil)
    ("programming is terrible" "http://programmingisterrible.com/rss" nil nil nil)
    ("Rands In Repose" "http://www.randsinrepose.com/index.xml" nil nil nil)
    ("Blog" "http://paulwhile.squarespace.com/blog/rss.xml" nil nil nil)
    ("simple links" "http://zenhabits.tumblr.com/rss" nil nil nil)
    ("The Setup" "http://usesthis.com/feed/" nil nil nil)
    ("We Use That" "http://weusethat.com/rss.xml" nil nil nil)
    ("Under the Tamarind Tree" "https://underthetamarindtree.wordpress.com/feed/" nil nil nil)
    ("Falkvinge on Infopolicy" "http://feeds.falkvinge.net/Falkvinge-on-Infopolicy" nil nil nil)
    ("Matt Might's blog" "http://matt.might.net/articles/feed.rss" nil nil nil)
    ("Simplexify" "http://simplexify.net/blog/atom.xml" nil nil nil)
    ("SMYCK" "http://smyck.net/feed/" nil nil nil)
    ("The Pastry Box Project" "http://the-pastry-box-project.net/feed/" nil nil nil)
    ("skud" "http://skud.dreamwidth.org/data/atom" nil nil nil)
    ("One Thing Well" "http://onethingwell.org/rss" nil nil nil)
    ("jake levine" "http://jakelevine.me/blog/feed/" nil nil nil)
    ("Steve Losh" "http://feeds2.feedburner.com/stevelosh" nil nil nil)
    ("DAILY VIOLET" "http://violetblue.tumblr.com/rss" nil nil nil)
    ("violet blue ® :: open source sex" "http://www.tinynibbles.com/feed" nil nil nil)
    ("This View of Life" "http://www.thisview.org/?feed=rss2" nil nil nil)
    ("Zack Shapiro" "http://zackshapiro.com/rss" nil nil nil)
    ("Zack Shapiro" "http://feeds.feedburner.com/zackshapiro/glGU" nil nil nil)
    ("Send More Paramedics" "http://blog.fogus.me/feed/" nil nil nil))))
;;(newsticker-start)
(provide 'rfnash-newsticker)
