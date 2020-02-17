class MovieCategoriesController < ApplicationController
  before_action :is_authenticated
  before_action :set_movie_category, only: [:show, :edit, :update, :destroy]

  # GET /movie_categories
  # GET /movie_categories.json
  def index
    @movie_categories = MovieCategory.all
  end

  # GET /movie_categories/1
  # GET /movie_categories/1.json
  def show
  end

  # GET /movie_categories/new
  def new
    @movie_category = MovieCategory.new
  end

  # GET /movie_categories/1/edit
  def edit
  end

  # POST /movie_categories
  # POST /movie_categories.json
  def create
    @movie_category = MovieCategory.new(movie_category_params)

    respond_to do |format|
      if @movie_category.save
        format.html { redirect_to movie_categories_url }
        format.json { render :show, status: :created, location: @movie_category }
      else
        format.html { render :new }
        format.json { render json: @movie_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie_categories/1
  # PATCH/PUT /movie_categories/1.json
  def update
    respond_to do |format|
      if @movie_category.update(movie_category_params)
        format.html { redirect_to movie_categories_url }
        format.json { render :show, status: :ok, location: @movie_category }
      else
        format.html { render :edit }
        format.json { render json: @movie_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_categories/1
  # DELETE /movie_categories/1.json
  def destroy
    respond_to do |format|
      if @movie_category.movies.count > 0
        format.html { redirect_to movie_categories_url, notice: { movie_category_error: 'Atencion! No se puede eliminar ya que es utilizada en peliculas.' } }
      else
        @movie_category.destroy
        format.html { redirect_to movie_categories_url }
        format.json { head :no_content }
      end
    end   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_category
      @movie_category = MovieCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_category_params
      params.require(:movie_category).permit(:name)
    end
end
