Measure 2-character Frequencies
-----

This repository contains measurements of 2-character frequencies (probabilities) in the English language.

Method
------

We chose 1000 books at random from the Gutenberg Project (gutenberg.org) and counted the raw number of 2-character sequences, summing the number of occurences of each sequence. The result is in random-1000-chars.json. The books chosen in our random sample is in random-1000.txt.

A tar archive of Gutenberg is available from http://www.gutenberg-tar.com/

Data
----

The json file contains three keys:

- books: this is the number of books sampled
- size: this is the total number of bytes in all files sampled
- counts: this is a dictionary of 2-character-sequences and their frequency counts

You can calculate the probability of an 2-character sequence in English by dividing the frequency count by the total number of bytes. For example the frequency count of "AT" is 20584, and the total number of bytes for all 1000 books was 412965523. So the prior probability of "AT" is 20584/412965523 = 0.000049844.

Code
----

You can use the count_chars.coffee script to replicate this work. Usage:

coffee count_chars.coffee <list of files>


