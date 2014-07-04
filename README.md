Measure 2-character Frequencies
-----

This repository contains measurements of 2-character frequencies (probabilities) in the English language.

Method
------

We chose 1000 books at random from the Gutenberg Project (gutenberg.org) and counted the raw number of 2-character sequences, summing the number of occurences of each sequence. The result is in random-1000-chars.json.

Data
----

The json file contains three keys:

- books: this is the number of books sampled
- size: this is the total number of bytes in all files sampled
- counts: this is a dictionary of 2-character-sequences and their frequency counts

Code
----

You can use the count_chars.coffee script to replicate this work. Usage:

coffee count_chars.coffee <list of files>


