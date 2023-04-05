class DnslookupsController < ApplicationController
    def lookup
      domain = params[:domain].to_s.strip
      @domain = domain
  
      if domain.present?
        record_types = ['A', 'CNAME', 'NS', 'MX', 'TXT']
        resolver = Dnsruby::Resolver.new
        @results = {}
  
        record_types.each do |record_type|
          begin
            response = resolver.query(domain, record_type)
            @results[record_type] = response.answer.select { |record| record.type.to_s == record_type }
            @results[record_type].each do |record|
              if record_type == 'CNAME' && record.name.to_s.include?('herokudns')
                record[:configured_for_heroku] = true
              elsif record_type == 'A' || record_type == 'AAAA'
                record[:address] = record.address.to_s
              end
            end
          rescue Dnsruby::NXDomain
            @results[record_type] = nil
          rescue StandardError => e
            # flash.now[:alert] = "Une erreur est survenue lors de la récupération des enregistrements DNS : #{e.message}"
          end
        end
      end
    end
  end
  