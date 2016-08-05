class ImagesController < ApplicationController
  before_filter :authorize
  def index
    @image = Image.paginate(:page => params[:page], :per_page => 5)
  end

  def new

  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    respond_to do |format|
      @params = params[:image]
      if @params['image'] == ''
        @params['image'] = nil?
      end
      if @image.update(image_params)
        format.html {redirect_to images_path, notice: 'Image was successfully updated'}
        format.json { render :show, status: :ok, location: @image}
      else
        format.html { render :edit }
        format.json {render json: @image.errors, status: :unprocessable_entity}
      end
    end
  end


  private
  def image_params
    params.require(:image).permit(:image, :product_id)
  end
end
