class DashboardsController < ApplicationController
  def show
    start_of_month = Date.today.beginning_of_month
    end_of_month = Date.today.end_of_month
    start_of_year = Date.today.beginning_of_year
    end_of_year = Date.today.end_of_year

    @data_for_month_pie_chart = {
      'Factures Payées ce Mois': Invoice.where(status: true, date: start_of_month..end_of_month).sum(:amount),
      'Factures Impayées ce Mois': Invoice.where(status: false, date: start_of_month..end_of_month).sum(:amount)
    }
  end
end
