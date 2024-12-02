class RedisService
  def initialize(namespace = "default")
    @redis = Redis.new
    @namespace = namespace
  end

  def save_result(key_id, result, expiration_time = 7200)
    redis_key = generate_key(key_id)
    puts "======================="
    puts "SAVING RESULT FOR KEY: #{redis_key}"
    puts "RESULT: #{result}"
    @redis.set(redis_key, result.to_json)
    @redis.expire(redis_key, expiration_time)
  end

  def fetch_result(key_id)
    redis_key = generate_key(key_id)
    data = @redis.get(redis_key)
    data ? JSON.parse(data) : nil
  end

  def fetch_all_results(key_prefix = nil)
    pattern = "#{@namespace}:#{key_prefix}*"
    keys = @redis.scan_each(match: pattern).to_a
    keys.map { |key| { key: key, value: JSON.parse(@redis.get(key)) } }
  end

  def delete_result(key_id)
    redis_key = generate_key(key_id)
    @redis.del(redis_key)
  end

  private

  def generate_key(key_id)
    "#{@namespace}:#{key_id}"
  end
end
