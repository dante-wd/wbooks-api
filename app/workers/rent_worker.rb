class RentWorker
  include Sidekiq::Worker

  def perform(rent)
    #envia un email avisando que se alquiló un libro con éxito
  end
end