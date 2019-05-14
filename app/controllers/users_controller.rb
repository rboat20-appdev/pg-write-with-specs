class UsersController < ApplicationController
  def index
    @users = User.all.order({ :username => :asc })

    render("users/index.html.erb")
  end

  def show
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("users/show.html.erb")
  end

  def own_photos
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("users/own.html.erb")
  end

  def liked_photos
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("users/liked.html.erb")
  end

  def feed
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("users/feed.html.erb")
  end

  def discover
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("users/discover.html.erb")
  end
end
