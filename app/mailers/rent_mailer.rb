class RentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rent_mailer.new_rent_notification.subject
  #

  def new_rent_notification(rent)
    @rent = rent
    locale = User.find_by(id: rent.user_id).try(:locale) || I18n.default_locale
    I18n.with_locale(locale) do
      subject = 'Alquiler nuevo - ID: ' + rent.id.to_s

      mail to: 'dantevvp@gmail.com', subject: subject
    end
  end
end
