class Admins::FoodsController < Admins::ApplicationController
  before_action :set_admins_food, only: [:show, :edit, :update, :destroy]

  # GET /admins/foods
  # GET /admins/foods.json
  def index
    @admins_foods = Food.all
  end

  # GET /admins/foods/1
  # GET /admins/foods/1.json
  def show
  end

  # GET /admins/foods/new
  def new
    @admins_food = Admins::Food.new
  end

  # GET /admins/foods/1/edit
  def edit
  end

  # POST /admins/foods
  # POST /admins/foods.json
  def create
    @admins_food = Food.new(admins_food_params)

    respond_to do |format|
      if @admins_food.save
        format.html { redirect_to [:admins, @admins_food], notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @admins_food }
      else
        format.html { render :new }
        format.json { render json: @admins_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/foods/1
  # PATCH/PUT /admins/foods/1.json
  def update
    respond_to do |format|
      if @admins_food.update(admins_food_params)
        format.html { redirect_to @admins_food, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @admins_food }
      else
        format.html { render :edit }
        format.json { render json: @admins_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/foods/1
  # DELETE /admins/foods/1.json
  def destroy
    @admins_food.destroy
    respond_to do |format|
      format.html { redirect_to admins_foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_food
      @admins_food = Admins::Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admins_food_params
      params.fetch(:admins_food, {})
    end
end
