class OperatorseshController < ApplicationController

  def new
    render :new
  end

  def create
    operator = Operator.find_by(user_name: operator_params)
    if authenticated?(operator)
      session[:operator_id] = operator.id
      flash[:good_message] =  "Welcome back #{operator.name}"
      redirect_to(admin_stores_path)
    else
      flash[:bad_message] = "Login Unsuccessful"
      redirect_to(operator_login_path)
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
 # def operator_params
 #   params.fetch(:operator, Hash.new).permit(params[:operatorsesh][:user_name], params[:operatorsesh][:password])
 # end
  def operator_params
    params[:operatorsesh][:user_name]
  end

  def authenticated?(operator)
    operator && operator.authenticate(params[:operatorsesh][:password])
  end
end
