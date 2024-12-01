require "sidekiq/api"

Rails.application.config.after_initialize do
  all_jobs = Sidekiq::ScheduledSet.new
  unless all_jobs.map(&:klass).include?("MonitorSchedulerJob")
    MyMonitor.schedule_intervals.each_value do |interval|
      MonitorSchedulerJob.perform_in(interval.minutes, interval)
    end
  end
 end
