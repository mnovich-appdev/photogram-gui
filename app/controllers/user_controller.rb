class UserController < ApplicationController

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:created_at => :desc})

    render({:template => "user_templates/index"})
  end
  
  def show
    id = params.fetch("path_id")

    matching_users = User.where({:id => id})
    @user = matching_users.last
    
    render({:template => "user_templates/show"})
  end
end