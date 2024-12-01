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
end
