class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Hash[(
                     if params[:client_id].present?
                       Client.find(params[:client_id]).invoices.includes([:company, :client])
                     elsif params[:company_id].present?
                       Company.find(params[:company_id]).invoices.includes([:company, :client])
                     else
                       Invoice.includes([:company, :client]).all
                     end).group_by { |i| i.invoice_date.beginning_of_month }.sort_by { |k, v| k.to_time }.reverse]
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @invoice.invoice_items.build
  end

  # GET /invoices/1/edit
  def edit
    @invoice.invoice_items.build if @invoice.invoice_items.empty?
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def invoice_params
    params.require(:invoice).permit(:company_id, :client_id, :invoice_no, :invoice_date, :reverse_charge, :transport_mode,
                                    :vehicle_no, :date_of_supply, :place_for_supply,
                                    invoice_items_attributes: [:id, :invoice_id, :description, :hsn_code, :udm, :quantity,
                                                               :rate, :amount, :gst_rate, :discount, :_destroy])
  end
end
