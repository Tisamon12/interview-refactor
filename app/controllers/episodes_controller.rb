class EpisodesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @tv_show = TvShow.find(params[:tv_show_id])
    @episodes = Episode.where(tv_show_id: params[:tv_show_id])
    render json: @episodes
  end

  def show
    @tv_show = TvShow.find(params[:tv_show_id])
    @episode = Episode.where(id: params[:id], tv_show_id: params[:tv_show_id]).first
    render json: @episode
  end

  def create
    @episode = Episode.new(episode_params)
    @episode.tv_show_id = params[:tv_show_id]
    if @episode.save
      render json: @episode
    end
  end

  def update
    @episode = Episode.where(id: params[:id], tv_show_id: params[:tv_show_id]).first
    if @episode.update_attributes(episode_params)
      render json: @episode
    end
  end

  def destroy
    @episode = Episode.where(id: params[:id], tv_show_id: params[:tv_show_id]).first
    @episode.delete
    render json: @episode
  end

  private
  def episode_params
    params.require('episode').permit('title', 'watched')
  end
end
