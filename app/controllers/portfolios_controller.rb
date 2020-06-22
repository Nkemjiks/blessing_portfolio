class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  layout "portfolio"
  access all: [:show, :index], user: { except: [:destroy, :new, :edit, :create, :update] }, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def show
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def edit
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_item_params)

    if @portfolio_item.save
      redirect_to portfolios_url, notice: "Portfolio was successfully created."
    else
      render :new
    end
  end

  def sort
    params[:order].each do |portfolio|
      Portfolio.find(portfolio[:id]).update(position: portfolio[:position])
    end

    head :ok
  end

  def update
    if @portfolio_item.update(portfolio_item_params)
      redirect_to portfolios_url, notice: "Portfolio was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @portfolio_item.destroy
    redirect_to portfolios_url, notice: "Portfolio was successfully destroyed."
  end

  private

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_item_params
    params.require(:portfolio).permit(
      :title,
      :subtitle,
      :body,
      :main_image,
      :thumb_image,
      technologies_attributes: [:name],
    )
  end
end
