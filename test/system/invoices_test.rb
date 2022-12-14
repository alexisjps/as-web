require "application_system_test_case"

class InvoicesTest < ApplicationSystemTestCase
  setup do
    @invoice = invoices(:one)
  end

  test "visiting the index" do
    visit invoices_url
    assert_selector "h1", text: "Invoices"
  end

  test "should create invoice" do
    visit invoices_url
    click_on "New invoice"

    fill_in "Amount", with: @invoice.amount
    fill_in "Customer address", with: @invoice.customer_address
    fill_in "Customer email", with: @invoice.customer_email
    fill_in "Customer name", with: @invoice.customer_name
    fill_in "Customer siret", with: @invoice.customer_siret
    fill_in "Date", with: @invoice.date
    fill_in "Description", with: @invoice.description
    fill_in "Invoice number", with: @invoice.invoice_number
    fill_in "Invoice tva", with: @invoice.invoice_tva
    fill_in "My compagny address", with: @invoice.my_compagny_address
    fill_in "My company email", with: @invoice.my_company_email
    fill_in "My company name", with: @invoice.my_company_name
    fill_in "My company paiement", with: @invoice.my_company_paiement
    fill_in "My company phone", with: @invoice.my_company_phone
    fill_in "My company siret", with: @invoice.my_company_siret
    fill_in "My company tva", with: @invoice.my_company_tva
    fill_in "Prestation", with: @invoice.prestation
    click_on "Create Invoice"

    assert_text "Invoice was successfully created"
    click_on "Back"
  end

  test "should update Invoice" do
    visit invoice_url(@invoice)
    click_on "Edit this invoice", match: :first

    fill_in "Amount", with: @invoice.amount
    fill_in "Customer address", with: @invoice.customer_address
    fill_in "Customer email", with: @invoice.customer_email
    fill_in "Customer name", with: @invoice.customer_name
    fill_in "Customer siret", with: @invoice.customer_siret
    fill_in "Date", with: @invoice.date
    fill_in "Description", with: @invoice.description
    fill_in "Invoice number", with: @invoice.invoice_number
    fill_in "Invoice tva", with: @invoice.invoice_tva
    fill_in "My compagny address", with: @invoice.my_compagny_address
    fill_in "My company email", with: @invoice.my_company_email
    fill_in "My company name", with: @invoice.my_company_name
    fill_in "My company paiement", with: @invoice.my_company_paiement
    fill_in "My company phone", with: @invoice.my_company_phone
    fill_in "My company siret", with: @invoice.my_company_siret
    fill_in "My company tva", with: @invoice.my_company_tva
    fill_in "Prestation", with: @invoice.prestation
    click_on "Update Invoice"

    assert_text "Invoice was successfully updated"
    click_on "Back"
  end

  test "should destroy Invoice" do
    visit invoice_url(@invoice)
    click_on "Destroy this invoice", match: :first

    assert_text "Invoice was successfully destroyed"
  end
end
