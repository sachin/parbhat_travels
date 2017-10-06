require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_url
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post invoices_url, params: { invoice: { client_id: @invoice.client_id, company_id: @invoice.company_id, date_of_supply: @invoice.date_of_supply, invoice_date: @invoice.invoice_date, invoice_no: @invoice.invoice_no, place_for_supply: @invoice.place_for_supply, reverse_charge: @invoice.reverse_charge, transport_mode: @invoice.transport_mode, vehicle_no: @invoice.vehicle_no } }
    end

    assert_redirected_to invoice_url(Invoice.last)
  end

  test "should show invoice" do
    get invoice_url(@invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_url(@invoice)
    assert_response :success
  end

  test "should update invoice" do
    patch invoice_url(@invoice), params: { invoice: { client_id: @invoice.client_id, company_id: @invoice.company_id, date_of_supply: @invoice.date_of_supply, invoice_date: @invoice.invoice_date, invoice_no: @invoice.invoice_no, place_for_supply: @invoice.place_for_supply, reverse_charge: @invoice.reverse_charge, transport_mode: @invoice.transport_mode, vehicle_no: @invoice.vehicle_no } }
    assert_redirected_to invoice_url(@invoice)
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete invoice_url(@invoice)
    end

    assert_redirected_to invoices_url
  end
end
