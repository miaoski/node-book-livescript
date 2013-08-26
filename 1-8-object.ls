# 1-8 Setting and enumerating objects with REPL
# You'll have to copy-and-paste the code into lsc REPL

list = [\a \b \c]

doThat = (first, second, third) ->
	console.log first

my-obj = { list, doThat }
