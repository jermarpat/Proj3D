class ResultsController < ApplicationController
   def index
   	@results=Result.all
   	@means=Array.new
   	@results.each do |s|
   	  count = s.num_1 + s.num_2 + s.num_3 + s.num_4 + s.num_5
   	  total = 1*s.num_1 + 2*s.num_2 + 3*s.num_3 + 4*s.num_4 + 5*s.num_5
      mean = 1.0*total/count
      @means << mean 
      end
   end
end
