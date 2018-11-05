class PeleasPeriodicasJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    intervalo = Rails.configuration.intervalo_peleas
    PeleasPeriodicasJob.set(wait: intervalo.minutes).perform_later
  end

  def perform(*args)
    PeleasService.pelear
  end
end
