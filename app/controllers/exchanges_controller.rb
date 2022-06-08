class ExchangesController < ApplicationController
  before_action :set_exchanges, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @exchanges = Exchange.all
  end

  def show; end

  def new
    @exchange = Exchange.new
  end

  def edit; end

  def create
    @exchange = Exchange.new(exchange_params)
    @exchange.author = current_user

    respond_to do
      if @exchange.save
        format.html { redirect_to exhange_path(@exchange), notice: 'Exchange was successfully created.' }
        format.json { render :show, status: :created, location: @exchange }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @exchange.update(exchange_params)
        format.html { redirect_to exhange_path(@exchange), notice: 'Exchange was successfully updated.' }
        format.json { render :show, status: :ok, location: @exchange }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exchange.destroy

    respond_to do |format|
      format.html { redirect_to exchanges_url, notice: 'Exchange was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_exchanges
    @exchange = Exchange.find(params[:id])
  end

  def exchange_params
    params.require(:exchange).permit(:name, :amount)
  end
end
