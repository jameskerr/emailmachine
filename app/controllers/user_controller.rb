class UserController < ApplicationController
  def index
		if params[:approved] == "false"
			@users = User.find_all_by_approved(false)
			@user_count = User.find_all_by_approved(false).count
		else
			@users = User.all
			@user_count = User.count
		end
	end
	
	def approve
		user = User.find(params[:id])
		user.update_attributes(:approved => true)
		redirect_to :action => "index", :approved => "false"
	end
end
