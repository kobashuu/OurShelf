class BooksController < ApplicationController
  after_action :create_notifications, only: [:request]
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def information
    @book = Book.find(params[:id])
  end

  def request
    user = User.find(params[:id])
    reader = User.find(params[:reader_id])
    book = user.books.find(params[:book_id])
    if book.reader_id == nil
      flash[:success] = "#{user.name}に貸出リクエストを送りました"
      redirect_to user
    else
      book.reader_id = nil
      book.save
      flash[:success] = "返却しました"
      redirect_to user
    end
  end


  def read
    user = User.find(params[:id])
    reader = User.find(params[:reader_id])
    book = user.books.find(params[:book_id])
    if book.reader_id == nil
      book.reader_id = reader.id
      book.save
      flash[:success] = "楽しんで！"
      redirect_to user
    else
      book.reader_id = nil
      book.save
      flash[:success] = "お疲れ様です！"
      redirect_to user
    end
  end

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
        redirect_to request.referrer || current_user
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
      params.require(:book).permit(:title, :author, :user_id, :picture, :reader_id)
    end

    def correct_user
      @book = current_user.books.find_by(id: params[:id])
      redirect_to current_user if @book.nil?
    end

    def create_notifications
      Notification.create(user_id: user.id,
        notified_by_id: current_user.id,
        book_id: book.id,)
   end

end
