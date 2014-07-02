class BookController < ApplicationController

  def index
  	@books = Book.all

    if session[:current_user_email] == nil
      
      session[:current_user_email] = params[:user][:email]
   
    else
      #nothing
    end

    @user = User.find_by email: session[:current_user_email]

  end

  def show
  	@book = Book.find(params[:id])
    
  end

  def new
    @book = Book.new
  end

  def create
    user = User.find_by email: session[:current_user_email]

    @book = Book.new(book_params)
    @book.email = user.email
    
    if @book.save
      redirect_to @book
    else
      # DO SOMETHING ELSE
    end
  end

  def edit
    @book = Book.all
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      # DO SOMETHING ELSE
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

    def book_params
      params.require(:book).permit(:title, :description, :thumbnail, :email)
    end
end

