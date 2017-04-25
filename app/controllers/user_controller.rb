class UserController < ApplicationController
  	before_action :check_session
  def index
    @user = User.find_by_id(session[:user_id])
    @connect = Friendship.where(friend_id: session[:user_id])
    @invite = Invite.where(inv_id: session[:user_id])
  end
  def edit
  	@user = User.includes(:friendships, :invites).find_by_id(session[:user_id])
    @users = User.all
  end
  def show
    @user = User.find_by_id(params[:id])
  end





  def invite
    Invite.create(user: User.find_by_id(session[:user_id]), inv: User.find_by_id(params[:id]))
    redirect_to '/profile'
  end
  def connect
    Friendship.create(user: User.find_by_id(params[:id]), friend: User.find_by_id(session[:user_id]))
    Invite.delete(Invite.where(user: params[:id], inv_id: session[:user_id]))
    redirect_to '/profile'
  end
  def uninvite
    Invite.delete(Invite.where(user: params[:id], inv_id: session[:user_id]))
    redirect_to '/profile'
  end
  def delete
    Friendship.delete(Friendship.where(user: params[:id], friend_id: session[:user_id]))
    redirect_to '/profile'
  end

  private
  def check_session
  	if !session[:user_id]
  		redirect_to '/'
    end
  end
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation, :description)
  end
end
