# Example for Natural - 1
# Ref. http://css.dzone.com/articles/using-natural-nlp-module

require! natural
stemmer = natural.PorterStemmer
#stemmer = natural.LancasterStemmer
log = console.log

log stemmer.stem \stems
log stemmer.stem \stemming
log stemmer.stem \stemmed
log stemmer.stem \stem

stemmer.attach!
log 'stemming'.stem!

log 'stems returned'.tokenizeAndStem!
