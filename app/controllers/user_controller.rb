class UserController < ApplicationController

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:created_at => :desc})

    render({:template => "user_templates/index"})
  end
  
  def show
    username = params.fetch("path_id")

    matching_users = User.where({:username => username})
    @user = matching_users.last
    
    render({:template => "user_templates/show"})
  end

  def create
    
    input_username = params.fetch("input_username")

    new_user = User.new

    new_user.username = input_username

    new_user.save

    redirect_to("/users/"+new_user.username)
  end

  def modify
    id = params.fetch("path_id")

    matching_users = User.where({:id => id})
    modified_user = matching_users.last

    input_username = params.fetch("input_username")

    modified_user.username = input_username

    modified_user.save

    redirect_to("/users/"+modified_user.username)
  end
end