class MonitorSchedulerJob
  include Sidekiq::Job

  def perform(current_interval)
    puts "============================================================"
    puts "STARTING FOR CURRENT INTERVAL: #{current_interval}"
    puts "============================================================"
    self.class.perform_in(current_interval.minutes, current_interval)
  end
end