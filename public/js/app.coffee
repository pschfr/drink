li = document.getElementsByTagName('li')
total = 0
eventList = ['click', 'keyup']
for drink, index in li
	drink.dataset.count = 0
	drink.tabIndex = index + 1
	do (drink) ->
		counter = 0
		for eventType in eventList
			drink.addEventListener(eventType, (event) ->
				if (event.type == 'keyup' and event.keyCode == 13) or event.type == 'click'
					counter++
					event.target.dataset.count = counter
					total++
					document.getElementById('total').innerHTML = total
			)
