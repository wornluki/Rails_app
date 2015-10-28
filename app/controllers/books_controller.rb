class BooksController < ApplicationController
  before_action :authenticate_user!, except: ["show"]
  before_filter :requie_permission
  before_action :find_user
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def new
    @book = @user.books.new
  end

  def create
    @book = @user.books.new book_params
    if @book.save
      redirect_to user_book_path(@user, @book)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update book_params
      redirect_to user_book_path(@user, @book), notice: "Książka została zaktualizowana"
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :author, :thumbnail)
  end

  def requie_permission
    @user = User.find(params[:user_id])
    if current_user != @user
      redirect_to root_path, notice: "Nie możesz zobaczyć tej strony"

    end
  end
end
