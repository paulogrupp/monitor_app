class MyMonitor < ApplicationRecord
  has_many :monitoring_results, dependent: :destroy

  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
end
