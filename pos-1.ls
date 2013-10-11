# Example for pos.js
# Ref. https://github.com/fortnightlabs/pos-js
# An implementation of Eric Brill's rule-based tagger

require! pos
log = console.log
words = new pos.Lexer!.lex \
	"This is some sample text.  This text can contain multiple sentences."
taggedWords = new pos.Tagger!.tag words

for i, t of taggedWords
	[word, tag] = t
	log "#word /#tag"
