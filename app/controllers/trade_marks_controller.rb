class TradeMarksController < ApplicationController
  before_action :set_trade_mark, only: [:show, :edit, :update, :destroy]

  # GET /trade_marks
  # GET /trade_marks.json
  def index
    @trade_marks = TradeMark.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /trade_marks/1
  # GET /trade_marks/1.json
  def show
  end

  # GET /trade_marks/new
  def new
    @trade_mark = TradeMark.new
  end

  # GET /trade_marks/1/edit
  def edit
  end

  # POST /trade_marks
  # POST /trade_marks.json
  def create
    @trade_mark = TradeMark.new(trade_mark_params)

    respond_to do |format|
      if @trade_mark.save
        format.html { redirect_to @trade_mark, notice: 'Trade mark was successfully created.' }
        format.json { render :show, status: :created, location: @trade_mark }
      else
        format.html { render :new }
        format.json { render json: @trade_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trade_marks/1
  # PATCH/PUT /trade_marks/1.json
  def update
    respond_to do |format|
      if @trade_mark.update(trade_mark_params)
        format.html { redirect_to @trade_mark, notice: 'Trade mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @trade_mark }
      else
        format.html { render :edit }
        format.json { render json: @trade_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trade_marks/1
  # DELETE /trade_marks/1.json
  def destroy
    @trade_mark.destroy
    respond_to do |format|
      format.html { redirect_to trade_marks_url, notice: 'Trade mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade_mark
      @trade_mark = TradeMark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_mark_params
      params.require(:trade_mark).permit(:name, :status)
    end
end
