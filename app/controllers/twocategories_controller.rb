class TwocategoriesController < ApplicationController
  before_action :set_twocategory, only: [:show, :edit, :update, :destroy]

  # GET /twocategories
  # GET /twocategories.json
  def index
    @twocategories = Twocategory.all
  end

  # GET /twocategories/1
  # GET /twocategories/1.json
  def show
  end

  # GET /twocategories/new
  def new
    @twocategory = Twocategory.new
  end

  # GET /twocategories/1/edit
  def edit
  end

  # POST /twocategories
  # POST /twocategories.json
  def create
    @twocategory = Twocategory.new(twocategory_params)

    respond_to do |format|
      if @twocategory.save
        format.html { redirect_to @twocategory, notice: 'Twocategory was successfully created.' }
        format.json { render :show, status: :created, location: @twocategory }
      else
        format.html { render :new }
        format.json { render json: @twocategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twocategories/1
  # PATCH/PUT /twocategories/1.json
  def update
    respond_to do |format|
      if @twocategory.update(twocategory_params)
        format.html { redirect_to @twocategory, notice: 'Twocategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @twocategory }
      else
        format.html { render :edit }
        format.json { render json: @twocategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twocategories/1
  # DELETE /twocategories/1.json
  def destroy
    @twocategory.destroy
    respond_to do |format|
      format.html { redirect_to twocategories_url, notice: 'Twocategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twocategory
      @twocategory = Twocategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twocategory_params
      params.require(:twocategory).permit(:category_id, :name, :meta_desc, :meta_key, :image)
    end
end
