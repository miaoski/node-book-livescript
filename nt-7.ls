# Example for Natural - 7
# Ref. http://css.dzone.com/articles/using-natural-nlp-module

require! natural
log = console.log

natural.BayesClassifier.load 'classifier.json', null, (err, cls) ->
	log cls.classify 'did the tests pass?'
