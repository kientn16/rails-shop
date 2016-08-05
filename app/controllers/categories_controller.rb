class CategoriesController < ApplicationController
  helper_method :get_data_parent, :get_data_parent2, :get_name_parent, :get_status
  # before_filter :authorize

  def index
    @category = Category.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @category = Category.new
    # @result =  get_data_parent(@dataParent)
  end

  def create

    # render plain: params[:category].inspect
    # return
    # get params
    @params = params[:category]
    if @params['parent_id'] == ''
      @params['parent_id'] = 0
    end
    # insert data
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end

  end

  def edit
    @category = Category.find(params[:id])
  end



  def update
    @params = params[:category]
    if @params['parent_id'] == ''
      @params['parent_id'] = 0
    end
    @cate = Category.find(params[:id])
    # render plain: category_params.inspect
    # return
    if @cate.update(category_params)
      # Handle a successful update.
      redirect_to categories_path
    else
      Rails.logger.info(@cate.errors.messages.inspect)
      render 'edit'
    end
  end

  def destroy
    @check = Category.where('parent_id=' + params[:id]).count
    if @check > 0
      @data = Category.find(params[:id])
      flash[:warning] = "Cannot delete Category: "+@data.name
      redirect_to categories_path
    else
      Category.find(params[:id]).destroy
      flash[:success] = "Category deleted"
      redirect_to categories_path
    end
  end


private
  def category_params
    params.require(:category).permit(:name, :parent_id, :status)
  end

  def get_data_parent (children_array = [],parent_id = 0,str = " -")

    children_array.each do |child|
      @id = child.id
      @name = child.name
      if child.parent_id == parent_id
        @result = str+@name,@id
        get_data_parent(children_array,@id, " --")
      end
    end
    # render plain: @result.inspect
    return @result
  end

  def has_children(datas,id)
    datas.each do |d|
      if d.parent_id == id
        return true
      end
    end
    return false
  end


  def get_data_parent2
    @dataParent = Category.where('parent_id = 0')
  end



  def get_name_parent (id)
    if id != 0
      @data = Category.find(id)
      @result = @data.name
    else
      @result = "Null"
    end
    return @result
  end

  def get_status (status)
    case status
      when 1
        return "Active"
      when 0
        return "Inactive"
    end
  end
end
