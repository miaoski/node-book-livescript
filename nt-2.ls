# Example for Natural - 2
# Ref. http://css.dzone.com/articles/using-natural-nlp-module

require! natural
#phonetic = natural.Metaphone
phonetic = natural.SoundEx
log = console.log

wordA = \phonetics
wordB = \fonetix
log 'they sound alike' if phonetic.compare wordA, wordB

log phonetic.process \phonetics

phonetic.attach!
log 'they sound alike' if wordA.soundsLike wordB
log 'phonetics rock'.tokenizeAndPhoneticize!
