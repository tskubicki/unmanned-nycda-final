module UsersHelper
	def check_for_login
		unless current_user
			redirect_to root_path
		end
	end
end
