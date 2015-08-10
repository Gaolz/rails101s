
(($) ->
  User =
    init: ->
      self = this
      Bootup = ->
        self.siteBootUp()
        return

      $(document).on "page:load", Bootup
      return

    siteBootUp: ->
      self = this
      self.initRainyDay()
      return

    # Rainy day
    initRainyDay: ->
    	image = document.getElementById("rainyday")
    	if typeof(image) != 'undefined' and image != null
    		image.onload = ->
    			engine = new RainyDay(image: this)
    			engine.rain [[
    				3
    				2
    				2
    			]], 100
    			return
    		image.crossOrigin = "anonymous"

  window.User = User
  return
) jQuery

$(document).ready ->
	User.init()
	User.siteBootUp()
	return