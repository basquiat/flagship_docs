class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.roots.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])

    # If type equals grid, set the display type to grid.
    # Otherwise, set it to table.
    @display_type = (params[:type] == 'grid' && 'grid') || 'table'

    if request.xhr? && request.format.html?
       render :partial => 'documents/' + @display_type, :locals => {:documents => @category.documents}
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @category }
      end
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @parent = nil
    @parent = Category.find(params[:parent_id]) if params[:parent_id]

    @category = Category.new(:parent => @parent)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to(@category, :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(@category, :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(category_url(@category.parent), :notice => 'Category was successfully removed.') }
      format.xml  { head :ok }
    end
  end
end
