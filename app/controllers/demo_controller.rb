class DemoController < ApplicationController
	layout 'admin'

	def index
	end
		
	def hello
		@array = [1,2,3,4,5]
		@id = params[:id].to_i
		@page = params[:page].to_i
	end

	def other_hello
		render(:text => 'Hello Everyone!')
	end

	def javascript
		
	end
end
class DemoController < ApplicationController
	layout 'admin'

	def index
	end

	def hello
		@array = [1,2,3,4,5]
		@id = params[:id].to_i
		@page = params[:page].to_i
	end

	def other_hello
		render(:text => "hello everyone")
	end

	def javascript
	end

	def text_helpers
	end

	def escape_output
	end
	
end