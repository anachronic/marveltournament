class ResetRankingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    PeleaService.reset_ranking
  end
end
