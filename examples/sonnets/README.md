# sonnets
SPITBOL programs for analyzing and sharing the Sonnets of William Shakespeare

This repository contains several SPITBOL programs that take as their input
the text of the sonnets of William Shakespeare.

The file *1041.txt* contains the text of the sonnets as made available by Project Gutenberg.

The file *tweet.sbl* contains a program that is used to power the twitter account @thebardstorms. 

Usage:

*sbl* *tweet.sbl* *todo* > *out*

The file *todo* contains the sonnets that have not yet been published. *Tweet.sbl* will write the text of the next sonnet in *todo*
to the file *out* as a tweetsrorm, then update *todo* to include the remaining sonnets.

To post a tweet:

Login in to twitter.com as @thebardstorms, and start to write a tweet.

Run the program as shown above, then open the file *out* in your browser.

Then, for each line, starting from the top, copy the line to the new tweet in twitter, post it, move
to the next line in the *out* window, and write the next tweet.

*concord.sbl* has as its goal the generation of a concordance for the sonnets. It is a work in progress.
