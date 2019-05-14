Rails.application.routes.draw do
  match("/", { :controller => "pictures", :action => "recent", :via => "get" })

  match("/recent", { :controller => "pictures", :action => "recent", :via => "get" })

  match("/popular", { :controller => "pictures", :action => "most_liked", :via => "get" })

  match("/photos/:some_id", { :controller => "pictures", :action => "show_details", :via => "get" })

  match("/users", { :controller => "users", :action => "index", :via => "get" })

  match("/users/:id", { :controller => "users", :action => "show", :via => "get" })

  match("/users/:id/liked", { :controller => "users", :action => "liked_photos", :via => "get" })

  match("/users/:id/feed", { :controller => "users", :action => "feed", :via => "get" })

  match("/users/:id/discover", { :controller => "users", :action => "discover", :via => "get" })


  # The routes below are for the ActiveAdmin dashboard located at /admin. You can ignore them.
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
