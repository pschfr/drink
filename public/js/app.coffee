li = document.getElementsByTagName('li')
total = 0
for drink in li
	drink.dataset.count = '0'
	do (drink) ->
		counter = 0
		drink.addEventListener('click', (event) ->
			counter++
			event.target.dataset.count = counter
			total++
			document.getElementById('total').innerHTML = 'Total: ' + total
		)
