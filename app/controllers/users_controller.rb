class UsersController < Clearance::UsersController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

	def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def update
    @user = User.find(params[:id])
    if current_user.role == "customer" && @user.id != current_user.id
      flash[:notice] = "This profile does not belong to you"
      render "edit"
    else
      if @user.update(user_params)
        redirect_to "/users/#{params[:id]}"
      else 
        render "edit"
      end
    end
  end

  def user_from_params
    email = user_params.delete(:email)
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.first_name = first_name
      user.last_name = last_name
      user.password = password
    end
  end

  private
  def user_params
    params.fetch(:user).permit(:first_name, :last_name,:email, :password, :avatar)
  end	

end
