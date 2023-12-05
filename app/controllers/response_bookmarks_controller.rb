class ResponseBookmarksController < ApplicationController
  def create
    # raise params.inspect
    @question = Question.find(params["response_bookmark"][:question_id])
    @playlist = Playlist.find(params[:playlist_id])
    @response_bookmark = ResponseBookmark.new
    @response_bookmark.question = @question
    @response_bookmark.playlist = @playlist
    @response_bookmark.save!
    redirect_to sub_user_playlists_path(@playlist.sub_user)
  end

  def destroy
    @playlist = Playlist.find(params[:playlist_id].to_i)
    @question = Question.find(params[:question_id].to_i)
    @response_bookmark = @playlist.response_bookmarks.select do |bookmark|
      bookmark.question_id == @question.id
    end
    @response_bookmark.first.destroy
    redirect_to sub_user_playlists_path(@playlist.sub_user), status: :see_other
  end
end
