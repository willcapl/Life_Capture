  class PlaylistsController < ApplicationController
    def new
      @playlist = Playlist.new
    end

    def create
      @playlist = Playlist.new(playlist_params)
      if @playlist.save
        redirect_to @playlist
      else
        render :new
      end
    end

    private

    def playlist_params
      params.require(:playlist).permit(:name, :description)
    end
  end
