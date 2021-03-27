### Turing School Project Week 5 - [Night_Writer](https://backend.turing.io/module1/projects/night_writer/)


Night_Writer is a command line interface app; it takes in a txt file in english (argument 1) and outputs a textfile in braille. The braille file name is specified in argument 2. 
```
$ ruby ./lib/night_writer.rb message.txt braille.txt
Created 'braille.txt' containing 256 characters
```
There is also braille to english functionality via night_reader:
```
$ ruby ./lib/night_reader.rb braille.txt original_message.txt
Created 'original_message.txt' containing 256 characters.
```

In its current format night_writer/reader only accepts lowercase characters.  
Given more time I would prioritize these changes:
  * Delete `output.rb`, and move it's responsibilities into the runner file similar to how the input files are currently read in.
  * Heavily refactor `sanitize_braille.rb`. In it's current state it is not easily read.
  * DRY up `converter` hash. 
  * Rename `converter` to `translator`.
  * Add support for uppcase letters.
  * Add support for common symbols.
