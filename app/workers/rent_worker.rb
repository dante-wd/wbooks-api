class RentWorker
  include Sidekiq::Worker

  def perform(rent_id)
    rent = Rent.find_by_id(rent_id)
    #enviar mail
  end
end