class ResponseBookmarksController < ApplicationController
  def create
    # raise params.inspect
    @question = Question.find(params["response_bookmark"][:question_id])
    @playlist = Playlist.find(params[:playlist_id])
    @response_bookmark = ResponseBookmark.new
    @response_bookmark.question = @question
    @response_bookmark.playlist = @playlist
    if @response_bookmark.save!

    else
      render :new, status: 422, alert: "You already have this in your playlist!"
    end
  end
end
