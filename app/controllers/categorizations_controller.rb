class CategorizationsController < ApplicationController

  def new
    @categorization = Categorization.new
  end

  def create
    @categorization = Categorization.new(kitten_params)
    @categorization.save
    redirect_to root_path
  end

  private

  def kitten_params
    params.require(:categorization).permit(:category_id).merge(kitten_id: params[:kitten_id])
  end
end