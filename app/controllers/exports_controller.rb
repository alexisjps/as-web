class ExportsController < ApplicationController
    def download
        @invoice = Invoice.where(params[:id])
        respond_to do |format|
            # // some other formats like: format.html { render :show }
            format.pdf do
                pdf = Prawn::Document.new
                pdf = render(:template => 'download')
                send_data pdf.render,
                filename: "export.pdf",
                type: 'application/pdf',
                disposition: 'inline'
            end
        end
    end
end
