# Example for Natural - 4
# Ref. http://css.dzone.com/articles/using-natural-nlp-module

require! natural
nounInflector = new natural.NounInflector
log = console.log

plural = nounInflector.pluralize 'radius'
log "The plural of radius = #plural"

singular = nounInflector.singularize 'beers'
log "The singular of beers = #singular"

nounInflector.attach!
log 'radius'.pluralizeNoun!
log 'beers'.singularizeNoun!

nounInflector.addPlural /(code|ware)/i, '$1z'
nounInflector.addSingular /(code|ware)z/i, '$1'
log 'code'.pluralizeNoun!
log 'ware'.pluralizeNoun!
log 'codez'.singularizeNoun!
log 'warez'.singularizeNoun!
