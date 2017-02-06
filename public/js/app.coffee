path = window.location.pathname

if path.includes('/articles/')
	li = document.getElementsByTagName('li')
	for drink in li
		drink.dataset.count = ''
		do (drink) ->
			counter = 0;
			drink.addEventListener('click', ->
				counter++
				event.target.dataset.count = counter
			)
