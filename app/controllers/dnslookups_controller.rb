require 'dnsruby'
require 'uri'

class DnslookupsController < ApplicationController
  def lookup
    domain = params[:domain]

    # Remove protocol and path from the URL, if present
    domain = URI.parse(domain).host if domain.present?

    if domain.present?
      record_types = ['A', 'CNAME', 'NS', 'MX', 'TXT']
      resolver = Dnsruby::Resolver.new
      @results = {}

      record_types.each do |record_type|
        begin
          response = resolver.query(domain, record_type)
          @results[record_type] = response.answer.select { |record| record.type.to_s == record_type }
        rescue Dnsruby::NXDomain
          @results[record_type] = nil
        rescue StandardError => e
          flash.now[:alert] = "Une erreur est survenue lors de la récupération des enregistrements DNS : #{e.message}"
        end
      end
    end
  end
end
