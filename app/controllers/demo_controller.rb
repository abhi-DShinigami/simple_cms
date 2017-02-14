class DemoController < ApplicationController

	layout 'application';

  def index
  	render('index')
  end


  def hello
  	@array = [1,2,4,5,6]
  end
end
