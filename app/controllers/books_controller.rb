class BooksController < ApplicationController
  
  def top
    
    
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "create successfully"
      redirect_to book_path(@book.id), method: :get
    else
      flash[:notice] = "error"
      render("books/index")
    end
  end
  
  
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    
    
  end

  def new
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "update successfully"
      redirect_to book_path(@book.id)
    else
      render ("books/edit")
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "destroy successfully"
      redirect_to books_path
    end
  end
  
  private
  
    def book_params
      params.require(:book).permit(:title, :body)
    end
  
end
