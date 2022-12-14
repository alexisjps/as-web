require "test_helper"

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
    assert_difference("Invoice.count") do
      post invoices_url, params: { invoice: { amount: @invoice.amount, customer_address: @invoice.customer_address, customer_email: @invoice.customer_email, customer_name: @invoice.customer_name, customer_siret: @invoice.customer_siret, date: @invoice.date, description: @invoice.description, invoice_number: @invoice.invoice_number, invoice_tva: @invoice.invoice_tva, my_compagny_address: @invoice.my_compagny_address, my_company_email: @invoice.my_company_email, my_company_name: @invoice.my_company_name, my_company_paiement: @invoice.my_company_paiement, my_company_phone: @invoice.my_company_phone, my_company_siret: @invoice.my_company_siret, my_company_tva: @invoice.my_company_tva, prestation: @invoice.prestation } }
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
    patch invoice_url(@invoice), params: { invoice: { amount: @invoice.amount, customer_address: @invoice.customer_address, customer_email: @invoice.customer_email, customer_name: @invoice.customer_name, customer_siret: @invoice.customer_siret, date: @invoice.date, description: @invoice.description, invoice_number: @invoice.invoice_number, invoice_tva: @invoice.invoice_tva, my_compagny_address: @invoice.my_compagny_address, my_company_email: @invoice.my_company_email, my_company_name: @invoice.my_company_name, my_company_paiement: @invoice.my_company_paiement, my_company_phone: @invoice.my_company_phone, my_company_siret: @invoice.my_company_siret, my_company_tva: @invoice.my_company_tva, prestation: @invoice.prestation } }
    assert_redirected_to invoice_url(@invoice)
  end

  test "should destroy invoice" do
    assert_difference("Invoice.count", -1) do
      delete invoice_url(@invoice)
    end

    assert_redirected_to invoices_url
  end
end
