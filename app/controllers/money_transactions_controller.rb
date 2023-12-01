class MoneyTransactionsController < ApplicationController
  before_action :set_money_transaction, only: %i[show edit update destroy]

  # GET /money_transactions or /money_transactions.json
  def index
    @money_transactions = MoneyTransaction.order(created_at: :desc)
  end

  # GET /money_transactions/1 or /money_transactions/1.json
  def show; end

  # GET /money_transactions/new
  def new
    @money_transaction = MoneyTransaction.new
  end

  # GET /money_transactions/1/edit
  def edit; end

  # POST /money_transactions or /money_transactions.json
  def create
    @money_transaction = current_user.money_transactions.new(money_transaction_params)

    if params[:money_transaction][:category_id].present?
      category = current_user.categories.find(params[:money_transaction][:category_id])
      @money_transaction.category = category
    end

    respond_to do |format|
      if @money_transaction.save
        format.html do
          redirect_to money_transactions_url, notice: 'Money transaction was successfully created.'
        end
        format.json { render :show, status: :created, location: @money_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @money_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /money_transactions/1 or /money_transactions/1.json
  def update
    respond_to do |format|
      if @money_transaction.update(money_transaction_params)
        format.html do
          redirect_to money_transaction_url(@money_transaction), notice: 'Money transaction was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @money_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @money_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /money_transactions/1 or /money_transactions/1.json
  def destroy
    @money_transaction.destroy!

    respond_to do |format|
      format.html { redirect_to money_transactions_url, notice: 'Money transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_money_transaction
    @money_transaction = MoneyTransaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def money_transaction_params
    params.require(:money_transaction).permit(:name, :amount)
  end
end
