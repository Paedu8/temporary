class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:category].blank?
  	 @flats = Flat.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @flats = Flat.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def new
  	@flat = current_user.flats.build
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def create
  	@flat = current_user.flats.build(flat_params)
    @flat.category_id = params[:category_id]

  	if @flat.save
  		redirect_to @flat
  	else
  		render 'new'
  	end
  end

  def show
  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def update
    @flat.category_id = params[:category_id]
  	if @flat.update(flat_params)
  		redirect_to @flat
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@flat.destroy
  	redirect_to root_path
  end

  private

  def find_flat
  	@flat = Flat.find(params[:id])
  end


  def flat_params
  	params.require(:flat).permit(:title, :description, :plz, :town, :category_id, :flat_image)
  end
end