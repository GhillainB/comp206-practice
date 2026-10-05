#!/bin/bash

#Output the text with all parentheses () replaced with box brackets [ ].
tr '()' '[]'

#Delete all the lowercase characters in the given block of text.
tr -d 'a-z'

#Replace all sequences of multiple spaces with just one space.
tr -s ' '

# Warning: Never redirect to the same file (tr 'a' 'b' < file.txt > file.txt), or you will wipe the file entirely
tr 'a' 'b' < input.txt > output.txt
