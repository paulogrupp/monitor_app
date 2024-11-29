class MonitoringResult < ApplicationRecord
  belongs_to :my_monitor

  validates :response_time, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :status_code, numericality: { only_integer: true }, allow_nil: true
end
