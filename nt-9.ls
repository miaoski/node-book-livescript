# Example for Natural - 9
# Ref. http://css.dzone.com/articles/using-natural-nlp-module

require! natural
log = console.log

log 'execution vs. intention --'
log natural.JaroWinklerDistance 'execution', 'intention'
log natural.LevenshteinDistance 'execution', 'intention'
log natural.DiceCoefficient 'execution', 'intention'

log 'same vs. same --'
log natural.JaroWinklerDistance 'same', 'same'
log natural.LevenshteinDistance 'same', 'same'
log natural.DiceCoefficient 'same', 'same'
