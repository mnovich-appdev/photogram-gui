Rails.application.routes.draw do

  get("/users", {:controller => "user", :action => "index"})
  get("/users/:path_id", {:controller => "user", :action => "show"})

  get("/update")
end
