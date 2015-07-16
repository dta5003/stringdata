stringdata
=======

### The Exercise:

> Using only core libraries, create a function which takes a string and outputs the character
> that appears the most along with its total count and the character that appears the least
> with its total count. In the event of a tie print the character with the lowest code point.
> Please provide your solution in a language of your choice and list any assumptions you
> make about the problem.

### My Implementation:

I created a module (Stringdata) with two available methods, getStringdata and printStringdata.  The parsing and other logic is done inside an inner class (StringdataParser).

When parsing, the characters of the input string are iterated through and put in a hash as (character, frequency) pairs.  The resulting hash is sent (cloned to allow destructive manipulation) to methods that sort by frequency and code point to determine the most frequent, least frequent, and their frequencies.

Tests are included, covering the happy path, invalid input, and edge cases.  I exercised test-driven development for the most part, with the tests prompting a few rounds of refactoring (most notably when I found that a clone of the hash needed to be sent to allow for the destructive filtering).

Some assumptions I made:
* I assumed all characters in the string are relevant, including whitespace.
* I assumed there was no needed validation of the input besides it being an empty string.