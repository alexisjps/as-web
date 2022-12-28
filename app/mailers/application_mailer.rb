class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"
  @invoice = Invoice.find(params[:id])
  @user = @invoice.user
end
