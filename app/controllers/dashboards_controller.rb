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

    @data_for_year_pie_chart = {
      'Factures Payées cette Année': Invoice.where(status: true, date: start_of_year..end_of_year).sum(:amount),
      'Factures Impayées cette Année': Invoice.where(status: false, date: start_of_year..end_of_year).sum(:amount)
    }
    puts @data_for_month_pie_chart.inspect
    puts @data_for_year_pie_chart.inspect
  end
end
