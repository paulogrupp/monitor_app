class MonitorExecutionJob
  include Sidekiq::Job

  def perform(monitor_id, monitor_url)
    monitor_service = MonitorExecutorService.new(monitor_id, monitor_url)
    result = monitor_service.execute
  end
end
