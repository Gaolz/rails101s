class WeixinsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	 def show
	 	@signature = params["signature"]
	 	@timestamp = params["timestamp"]
	 	@nonce = params["nonce"]
	 	    
 	  	@token = ENV["weixin_token"]
 	  	@tmpArr = [@token, @timestamp, @nonce]
 	  	@tmpArr.sort!
 	  	@tmpStr = @tmpArr.join
 	  	@tmpStr = Digest::SHA1.hexdigest( @tmpStr )
	 		
 	  	if @tmpStr == @signature
 	  		render text: params["echostr"]
 	  	else
 	  		render nothing: true
 	    	end
	 end
end
