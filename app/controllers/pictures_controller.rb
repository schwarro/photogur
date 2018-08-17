class PicturesController < ApplicationController

  before_action :ensure_logged_in, except: [:show, :index]
  before_action :load_picture, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_owns_picture, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all
    @older_than_30 = Picture.created_before("2018-07-07 00:00:00")
    @pics_in_2017 = Picture.created_in_year("2017")
    @pics_in_2018 = Picture.created_in_year("2018")
  end

  def show
    load_picture
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]
    @picture.user_id = current_user.id

    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      # redirect_to "/pictures"
      redirect_to pictures_url, notice: "Picture Added"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def edit
    load_picture
  end

  def update
    load_picture

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]


    if @picture.save
      # redirect_to "/pictures/#{@picture.id}"
      redirect_to picture_url(@picture.id)
    else
      render :edit
    end
  end

  def destroy
    load_picture
    @picture.destroy
    redirect_to "/pictures"
  end

  def ensure_user_owns_picture
    unless current_user == @picture.user
      flash[:alert] = "Please log in"
      redirect_to new_session_url
    end
  end

  def load_picture
    @picture = Picture.find(params[:id])
  end




end
