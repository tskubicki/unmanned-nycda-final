module ApplicationHelper
	#def signed_in
	#	if user_signed_in?
	#  		redirect_to user_path(current_user)
	#  	end
	#end

	def boot_non_admins #before anything, checks admin and boots you to the main page if you lack it
		if !current_user || current_user.role.is_admin == false
		  redirect_to root_path 
		end
	end

	def check_for_login
		unless current_user
			redirect_to root_path
		end
	end
end
