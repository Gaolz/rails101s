
# Rainy day
window.Users =
initRainyDay: ->
	image = document.getElementById("rainyday")
	if typeof(image) != 'undefined' and image != null
		image.onload = ->
			engine = new RainyDay(image: this)
			engine.rain [[
				3
				3
				2
			]], 100
			return
		image.crossOrigin = "anonymous"

$(document).ready ->
	Users.initRainyDay()
	return