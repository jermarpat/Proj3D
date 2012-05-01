class UsersController < ApplicationController
  def index
   @Users=User.all
   respond_to do |format|
   format.json {render :json =>@Users}
   end
  end

end
