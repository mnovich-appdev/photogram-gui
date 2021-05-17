class PhotoController < ApplicationController

  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})

    render({:template => "photo_templates/index"})
  end
  
  def show
    id = params.fetch("path_id")

    matching_photos = Photo.where({:id => id})
    @photo = matching_photos.last

    render({:template => "photo_templates/show"})
  end

  def delete
    id = params.fetch("path_id")

    matching_photos = Photo.where({:id => id})
    photo = matching_photos.last 

    photo.destroy
    
    redirect_to("/photos")
  end

  def create
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")

    new_photo = Photo.new

    new_photo.image = input_image
    new_photo.caption = input_caption
    new_photo.owner_id = input_owner_id

    new_photo.save

    redirect_to("/photos/"+new_photo.id.to_s)
  end

  def modify
    id = params.fetch("path_id")

    matching_photos = Photo.where({:id => id})
    photo = matching_photos.last

    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")

    photo.image = input_image
    photo.caption = input_caption

    photo.save

    redirect_to("/photos/"+photo.id.to_s)
  end

  def comment
    input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_body = params.fetch("input_body")

    new_comment = Comment.new

    new_comment.body = input_body
    new_comment.author_id = input_author_id
    new_comment.photo_id = input_photo_id
    
    new_comment.save
    
    redirect_to("/photos/"+input_photo_id.to_s)
  end
end