# Example for Natural - 3
# Ref. http://css.dzone.com/articles/using-natural-nlp-module

require! natural
TfIdf = natural.TfIdf
tfidf = new TfIdf!		# Yuck!  So ugly!

tfidf.addDocument 'i code in c.'
tfidf.addDocument 'i code in ruby.'
tfidf.addDocument 'i code in c and node, but node more often.'
tfidf.addDocument 'this document is about natural, written in node'
tfidf.addDocument 'i code in fortran.'

console.log 'node ---------------------------------'
tfidf.tfidfs 'node', (i, measure) !->
	console.log "document #i is #measure"

console.log 'ruby ---------------------------------'
tfidf.tfidfs 'ruby', (i, measure) !->
	console.log "document #i is #measure"

console.log 'code ---------------------------------'
tfidf.tfidfs 'code', (i, measure) !->
	console.log "document #i is #measure"

console.log 'in   ------( note the tokeniser )-----'
tfidf.tfidfs 'in', (i, measure) !->
	console.log "document #i is #measure"

console.log 'TF-IDF of "node" in document 2:', tfidf.tfidf 'node', 2

console.log 'listTerms in document 4:'
(tfidf.listTerms 4).forEach !->
	console.log it.term + ': ' + it.tfidf
