class EventWorker
  include Sidekiq::Worker
  sidekiq_options :backtrace => true
  def perform(attributes)
    Event.new(attributes).save
  end
end
