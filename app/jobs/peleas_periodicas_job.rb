class PeleasPeriodicasJob < ApplicationJob
  queue_as :default

  def perform(*args)
    PeleasService.pelear
  end
end
