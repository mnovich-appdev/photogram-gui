Rails.application.routes.draw do

  get("/", {:controller => "user", :action => "index"})

  get("/users", {:controller => "user", :action => "index"})
  get("/users/:path_id", {:controller => "user", :action => "show"})

  get("/photos", {:controller => "photo", :action => "index"})
  get("/photos/:path_id", {:controller => "photo", :action => "show"})

  get("/insert_user_record", {:controller => "user", :action => "create"})

  get("/update_user/:path_id", {:controller => "user", :action => "modify"})

  get("/insert_photo_record", {:controller => "photo", :action => "create"})

  get("/delete_photo/:path_id", {:controller => "photo", :action => "delete"})

  get("/update_photo/:path_id", {:controller => "photo", :action => "modify"})

  get("/insert_comment_record", {:controller => "photo", :action => "comment"})
end
