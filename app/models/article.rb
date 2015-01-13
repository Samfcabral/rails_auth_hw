require 'typhoeus'

class Article < ActiveRecord::Base
	def make_request
		request = Typhoeus::Request.new(
		  "http://access.alchemyapi.com/calls/text/TextGetRankedKeywords",
		  method: :get,
		  params: { apikey: "125279d7cc8a774d5af6d634b0d1344ee61f0f6b",
		  			text: content,
		  			maxRetrieve: 10,  
		  			keywordExtractMode: "normal",
		  			outputMode: 'json' },
		  headers: { Accept: "text/html" }
		)
		request.run
		response = request.response
	    keywordResults = JSON.parse(response.body)
	    keyword = keywordResults["keywords"]
	    relevance = keywordResults["relevance"]
	    puts keywordResults
	    return keyword
	end
end
