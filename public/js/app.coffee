# Gather all drinks! (list items)
li = document.getElementsByTagName('li')
# Initiate total counter
total = 0

# Loop over drinks!
for drink, index in li
	# Set all counters to 0
	drink.dataset.count = 0
	# Adds proper tabIndex to each li
	drink.tabIndex = index++
	# For each drink item, do this...
	do (drink) ->
		# New counter
		counter = 0
		# On click or keyup...
		for eventType in ['click', 'keyup']
			drink.addEventListener(eventType, (event) ->
				# But only if Enter key or click...
				if (event.type == 'keyup' and event.keyCode == 13) or event.type == 'click'
					# increment individual and total counters
					counter++
					event.target.dataset.count = counter
					total++
					document.getElementById('total').innerHTML = total
			)
