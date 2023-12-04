  class PlaylistsController < ApplicationController
    def new
      @playlist = Playlist.new
    end

    def create
      @sub_user = SubUser.find(params[:sub_user_id])
      @playlist = Playlist.new(playlist_params)
      @playlist.sub_user = @sub_user
      if @playlist.save
        redirect_to sub_user_playlists_path(@sub_user)
      end
    end

    def index
      @sub_user = SubUser.find(params[:sub_user_id])
      @playlists = @sub_user.playlists
      @playlist = Playlist.new
      @response_bookmark = ResponseBookmark.new
      @questions = Question.where(sub_user: @sub_user)

    end

    private

    def playlist_params
      params.require(:playlist).permit(:name, :description)
    end
  end
