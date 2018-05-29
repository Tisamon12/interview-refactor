class TvShowsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @tv_shows = TvShow.all
    render json: @tv_shows
  end

  def show
    @tv_show = TvShow.find(params[:id])
    render json: @tv_show
  end

  def create
    @tv_show = TvShow.new(tv_show_params)
    if @tv_show.save
      render json: @tv_show
    end
  end

  def update
    @tv_show = TvShow.find(params[:id])
    if @tv_show.update_attributes(tv_show_params)
      render json: @tv_show
    end
  end

  def destroy
    @tv_show = TvShow.find(params[:id])
    @tv_show.delete
    render json: @tv_show
  end

  private
  def tv_show_params
    params.require('tv_show').permit('title', 'description')
  end
end
