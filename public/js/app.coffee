# Regex to get the game name from URL
game = window.location.pathname.replace(/\/drink/ig, '').replace(/\/games\//ig, '').replace(/\.html/ig, '')

if game != '/'
	# Initiate total counter
	if (localStorage.getItem(game + '-game-total') != null)
		total = localStorage.getItem(game + '-game-total')
		document.getElementById('total').innerHTML = total
	else
		total = 0

	# Loop over drinks!
	for drink, index in document.getElementsByTagName('li')
		# Checks for count in localStorage, or sets it to 0
		if (localStorage.getItem(game + '-question-' + index) != null)
			drink.dataset.count = localStorage.getItem(game + '-question-' + index)
		else
			drink.dataset.count = 0
		# Adds proper tabIndex to each li
		drink.tabIndex = index++
		# For each drink item, do this...
		do (drink) ->
			# New counter
			counter = drink.dataset.count
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

						# Stores new total in localStorage
						localStorage.setItem(game + '-game-total', total)

						# Stores new question count as well
						localStorage.setItem(game + '-question-' + event.target.tabIndex, counter)
				)

if game == '/'
	# Loop over all games!
	for game in document.getElementsByTagName('a')
		if game.id != ''
			# If game total is in localStorage, set it, otherwise set to 0
			if localStorage.getItem(game.id + "-game-total") != null
				game.dataset.count = localStorage.getItem(game.id + "-game-total")
			else
				game.dataset.count = 0
