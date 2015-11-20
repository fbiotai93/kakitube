class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)
    @bookmark.save
    render
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmarkable = @bookmark.bookmarkable
    result = @bookmark.destroy!
    render
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:user_id, :bookmarkable_id, :bookmarkable_type)
  end
end
