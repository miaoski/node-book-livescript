# Example for Natural - 5
# Ref. http://css.dzone.com/articles/using-natural-nlp-module

require! natural
countInflector = natural.CountInflector
log = console.log

for i from 1 to 4
	log countInflector.nth i
for i from 10 to 13
	log countInflector.nth i
for i from 100 to 103
	log countInflector.nth i
for i from 111 to 113
	log countInflector.nth i
