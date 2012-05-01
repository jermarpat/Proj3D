class PagesController < ApplicationController
   def login
      logging = false
      if params[:username] == nil
         username = password = ""
      else
         username = params[:username]
         password = params[:password]
         logging = true
      end
      conn = ActiveRecord::Base.connection
      user_id = conn.select_value("select getID('" + username + "','" + password + "')").to_i
      if logging == true
         cookies.signed[:uid] = user_id
         
         if user_id > 0
           user = User.find_by_id(user_id)
           cookies.signed[:dept] = user.department
           cookies.signed[:division] = user.division
         end
         redirect_to :controller => "pages", :action => "admin" 
      end
   end
   def admin
      @id = cookies.signed[:uid]
      respond_to do |format| 
         format.html {render :text => @id}
      end
   end
end
