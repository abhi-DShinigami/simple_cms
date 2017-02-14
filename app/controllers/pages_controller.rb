class PagesController < ApplicationController
 
  layout 'admin'
  
  before_action :find_subjects, :only => [:new, :update, :create, :edit]
  before_action :find_subject
  before_action :confirm_logged_in
  
  def index
    @pages = @subject.pages.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(:subject_id => @subject.id)
	@page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
    
    if @page.save
        
        flash[:notice] = "Page has been created sucessfully."
        redirect_to(pages_path(:subject_id => @subject.id))
    else
		@page_count = Page.count + 1
        render('new')
    end
  end
  
  
  def edit
    @page = Page.find(params[:id])
	@page_count = Page.count
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page Updated Sucessfully."
      redirect_to(page_path(@page, :subject_id => @subject.id) )
    else
	  @page_count = Page.count
      render('edit')
    end
    
  end

  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    
    flash[:notice] = "Page Destroyed succcessfully."
    redirect_to(pages_path(:subject_id => @subject.id) )
  end
  
  private
  
  def page_params
    params.require(:page).permit(:name,:subject_id,:permalink ,:position, :visible)
  end
  
  def find_subject
    @subject  = Subject.find(params[:subject_id])
  end
  
  
  def find_subjects
    @subjects = Subject.sorted
  end
   
  
  
  
end
