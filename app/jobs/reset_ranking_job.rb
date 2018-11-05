class ResetRankingJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    ResetRankingJob.set(wait_until: Date.today.midnight).perform_later
  end

  def perform(*args)
    PeleaService.reset_ranking
  end
end
