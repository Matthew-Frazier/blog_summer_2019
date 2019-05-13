class PagesController < ApplicationController
  def index
    @pages = Page.order(:id)
    # render :index #this is a default
  end

  def show
    @page = Page.find(params[:id])
    # render :show #this is a default
  end

  def new
    @page = Page.new
    #render :new #this is a default
  end

  def create
    
    @page = Page.new(page_params)

    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  def edit
    # params = { id: "6"}
    @page = Page.find(params[:id])
    #render :edit
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      redirect_to pages_path
    else
      render :edit
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end

  private 
    def page_params
      params.require(:page).permit(:title, :author, :body)
    end

end
