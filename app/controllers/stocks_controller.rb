class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "Your search is empty."
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "Your entry is not a stock symbol." unless @stock
    end
      respond_to do |format|
        format.js { render partial: 'users/result' }
    end
  end
end
