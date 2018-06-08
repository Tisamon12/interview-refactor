class RanksController < ApplicationController
    before_action :authenticate_user

    def index
        @ranks = Rank.where(tv_show_id: params[:tv_show_id])
        render json: @ranks
    end

    def create
        @rank = Rank.new(rank_params)
        @rank.tv_show_id = params[:tv_show_id]
        @rank.user_id = current_user.id
        if @rank.save
            render json: @rank
        end
    end

    def update
        @rank = Rank.where(id: params[:id], tv_show_id: params[:tv_show_id]).first
        if @rank.update_attributes(rank_params)
            render json: @episode
        end
    end

    private
    def rank_params
        params.require('rank').permit('value')
    end
end
