class BooksController < ApplicationController
  def index
    @books=Book.all
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
if @book.save
    redirect_to book_path(book.id)
    flash[:notice]="successfully"
else
    @books=Book.all
    render action: :index
end
  end

  def show
    @book=Book.find(params[:id])
  end

  def new
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
if @book.update(book_params)
    redirect_to book_path
    flash[:notice]="successfuly"
else
    render action: :edit
end
  end


  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice]="successfully"
  end

private
def book_params
  params.require(:book).permit(:title,:body)
end
end
