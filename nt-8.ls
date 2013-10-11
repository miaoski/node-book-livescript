# Example for Natural - 8
# Ref. http://css.dzone.com/articles/using-natural-nlp-module

require! natural
NGrams = natural.NGrams
log = console.log

log 'trigrams ---'
log NGrams.trigrams 'some other words here'
log NGrams.trigrams [\some \other \words \here]

log 'bigrams --'
log NGrams.bigrams 'some other words here'
log NGrams.bigrams [\some \other \words \here]

log '4-grams --'
log NGrams.ngrams 'some other words here for you', 4
