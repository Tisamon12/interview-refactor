class EpisodesController < ApplicationController
  before_action :authenticate_user!

  def index
    @tv_show = TvShow.find(params[:tv_show_id])
    @episodes = Episode.where(tv_show_id: @tv_show.id)
    render json: @episodes
  end

  def show
    @tv_show = TvShow.find(params[:tv_show_id])
    @episode = Episode.where(id: params[:id], tv_show_id: @tv_show.id).first
    render json: @episode
  end

  def create
    @tv_show = TvShow.find(params[:tv_show_id])
    @episode = Episode.new(episode_params)
    @episode.tv_show_id = @tv_show.id
    if @episode.save
      render json: @episode
    end
  end

  def update
    @tv_show = TvShow.find(params[:tv_show_id])
    @episode = Episode.where(id: params[:id], tv_show_id: @tv_show.id).first
    if @episode.update_attributes(episode_params)
      render json: @episode
    end
  end

  def destroy
    @tv_show = TvShow.find(params[:tv_show_id])
    @episode = Episode.where(id: params[:id], tv_show_id: @tv_show.id).first
    @episode.delete
    render json: @episode
  end

  private
  def episode_params
    params.require('episode').permit('title', 'watched')
  end
end
