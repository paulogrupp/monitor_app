require "net/http"

class MonitorExecutorService
  REDIS_NAMESPACE = "monitor_results".freeze

  def initialize(monitor_id, monitor_url)
    @monitor_id = monitor_id
    @monitor_url = monitor_url
    @redis_service = RedisService.new(REDIS_NAMESPACE)
  end

  def execute
    response, duration, error_message = perform_http_request
    result = build_result(response, duration, error_message)
    save_result_to_redis(result)
    result
  end

  private

  def perform_http_request
    uri = URI(@monitor_url)
    start_time = Time.now
    response = nil
    error_message = nil

    begin
      puts "PERFORMING HTTP REQUEST FOR URL: #{@monitor_url}"
      response = Net::HTTP.get_response(uri)
    rescue StandardError => e
      error_message = e.message
    end

    duration = Time.now - start_time
    puts "HTTP REQUEST FOR URL: #{@monitor_url} COMPLETED IN #{duration} SECONDS"
    [ response, duration, error_message ]
  end

  def build_result(response, duration, error_message)
    {
      monitor_id: @monitor_id,
      url: @monitor_url,
      response_time: duration,
      status_code: response&.code || "error",
      response_message: response&.message || error_message,
      checked_at: Time.current.to_i
    }
  end

  def save_result_to_redis(result)
    key = "#{result[:monitor_id]}-#{result[:checked_at]}"
    @redis_service.save_result(key, result)
  end
end
