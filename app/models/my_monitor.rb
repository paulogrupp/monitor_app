class MyMonitor < ApplicationRecord
  enum :schedule_interval, {
    every_1_minute: 1,
    every_5_minutes: 3,
    every_10_minutes: 5,
    every_30_minutes: 30,
    every_60_minutes: 60
  }

  has_many :monitoring_results, dependent: :destroy

  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :schedule_interval, presence: true

  def self.schedule_jobs_for_interval(interval)
    MyMonitor.where(schedule_interval: interval).each do |my_monitor|
      MonitorExecutionJob.perform_async(my_monitor.id, my_monitor.url)
    end
  end
end
