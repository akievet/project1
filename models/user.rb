class User < ActiveRecord::Base
	include BCrypt

	def password 
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

	def authenticate(attempted_password)
		if self.password == attempted_password
			true
		else
			false
		end
	end

	def create
		@user = User.new(params[:user])
		@user.password = params[:password]
		@user.save!
	end

	# def login
	# 	@user = User.find_by_email(params[:email])
	# 	if @user.password == params[:password]
	# 		give_token
	# 	else
	# 		redirect_to home_url
	# 	end
	# end

	# def forgot_password
	# 	@user = User.find_by_email(params[:email])
	# 	random_password = Array.new(10).map { (65 + rand(58)).chr }.join
	# 	@user.password = random_password
	# 	@user.save!
	# 	Mailer.create_and_deliver_password_change(@user, random_password)
	# end
end









