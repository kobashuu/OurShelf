class BooksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def search
    if params[:title] #書籍名で検索
      @items = RakutenWebService::Books::Book.search(title: params[:title])
    elsif params[:author] #著者名で検索
      @items = RakutenWebService::Books::Book.search(author: params[:author])
    end

  end

  def create
    @book = current_user.books.build(book_params)
      if @book.save
        flash[:success] = "本棚に追加しました！"
        redirect_to current_user
      else
        render 'search'
      end
    end

  def destroy
    @book.destroy
    flash[:success] = "消去しました"
    redirect_to request.referrer || root_url
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :user_id, :picture)
    end

    def correct_user
      @book = current_user.books.find_by(id: params[:id])
      redirect_to current_user if @book.nil?
    end
end
