class ResponseBookmarksController < ApplicationController
  def create
    # raise params.inspect
    @question = Question.find(params["response_bookmark"][:question_id])
    @playlist = Playlist.find(params[:playlist_id])
    @response_bookmark = ResponseBookmark.new
    @response_bookmark.question = @question
    @response_bookmark.playlist = @playlist
    @response_bookmark.save!
  end
end
