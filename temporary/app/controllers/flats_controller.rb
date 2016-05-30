class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
  	@flats = Flat.all.order("created_at DESC")
  end

  def new
  	@flat = current_user.flats.build
  end

  def create
  	@flat = current_user.flats.build(flat_params)

  	if @flat.save
  		redirect_to @flat
  	else
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update

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
  	params.require(:flat).permit(:title, :description, :plz, :town)
  end
end