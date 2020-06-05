class RentWorker
  include Sidekiq::Worker

  def perform(rent_id)
    rent = Rent.find_by(id: rent_id)
    RentMailer.new_rent_notification(rent) if rent
  end
end
