class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book1 = Book.new
    @user = @book.user
  end

  def  create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user

    if @book.save
      redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
      @books =Book.all
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    if current_user == @book.user
      render :edit
    else
      redirect_to books_path
    end  
      
      
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book.id), notice: 'Book was successfully updated'
    else
      render :edit
    end
  end  

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
