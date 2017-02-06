li = document.getElementsByTagName('li')
total = 0
for drink in li
	drink.dataset.count = ''
	do (drink) ->
		counter = 0
		drink.addEventListener('click', ->
			counter++
			event.target.dataset.count = counter
			total++
			document.getElementById('total').innerHTML = 'Total: ' + total
		)
