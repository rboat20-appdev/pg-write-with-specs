class PicturesController < ApplicationController
  def recent
    @photos = Photo.all.order({ :created_at => :desc }).limit(25)

    render("pic_templates/time_list.html.erb")
  end

  def most_liked
    @photos = Photo.all.order({ :likes_count => :desc }).limit(25)

    render("pic_templates/liked_list.html.erb")
  end

  def show_details
    photo_id = params.fetch("some_id")

    @pic = Photo.where({ :id => photo_id }).at(0)

    render("pic_templates/details.html.erb")
  end
  
  def byebye
    
    pic_id = params.fetch("id_to_delete")
  
    photo = Photo.where({:id => pic_id}).at(0)
    
    photo.destroy
    
    redirect_to("/popular")

  end   
  
  def blank_form  
    
    render("pic_templates/new_photo_form.html.erb")
  
  end
  
  def save_photo_row
    
    #  Parameters: {"pic_image"=>"https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png", "pic_caption"=>"adsf", "pic_id"=>"117"}
    
    p = Photo.new
    p.image = params.fetch("pic_image")
    p.caption = params.fetch("pic_caption")
    p.owner_id = params.fetch("pic_owner_id")
    
    p.save
    
    redirect_to("/recent")
    
  end  
  
  def prepopulated_form
    
    edit_photo_id = params.fetch("id_to_update")

    @editpic = Photo.where({ :id => edit_photo_id }).at(0)

    render("pic_templates/editphoto.html.erb")
  end
  
  def update_record
    
    update_photo_id = params.fetch("id_to_update")
    
    @updatepic = Photo.where({:id => update_photo_id}).at(0)
    
    @updatepic.image = params.fetch("pic_image")
    @updatepic.caption = params.fetch("pic_caption")
    
    @updatepic.save
    
    redirect_to("/photos/"+@updatepic.id.to_s)
    
  end
  
  def add_new_fan
    # do this like save new photo but its for save new like
     
    l = Like.new
    l.fan_id = params.fetch("pic_fan_id")
    l.photo_id = params.fetch("photo_id")
    
    l.save
    
    redirect_to("/photos/"+l.photo_id.to_s)
    
    #could do  + l.photo_id.to_s or #{l.photo_id} -- this is for embedded string
    
  end
  
end
