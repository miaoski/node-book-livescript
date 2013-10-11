# Example for Natural - 6
# Ref. http://css.dzone.com/articles/using-natural-nlp-module

require! natural
stemmer = natural.LancasterStemmer
classifier = new natural.BayesClassifier!
# classifier = new natural.BayesClassifier stemmer
log = console.log

classifier.addDocument "my unit-tests failed.", 'software'
classifier.addDocument "tried the program, but it was buggy.", 'software'
classifier.addDocument "the drive has a 2TB capacity.", 'hardware'
classifier.addDocument "i need a new power supply.", 'hardware'
classifier.train!

log classifier.classify 'did the tests pass?'
log classifier.classify 'did you buy a new drive?'

classifier.addDocument ['unit', 'test'], 'software'
classifier.addDocument ['bug', 'program'], 'software'
classifier.addDocument ['drive', 'capacity'], 'hardware'
classifier.addDocument ['power', 'supply'], 'hardware'
classifier.train!
classifier.save 'classifier.json', (err, classifier) !->
	if err
		log "err = #err"
	else
		log "classifier.json saved!"
