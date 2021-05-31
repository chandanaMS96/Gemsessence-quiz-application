module QuestionsHelper
  def get_timestamp_timer time_limit
    time_arr = time_limit.split(":")
    total_seconds = time_arr[0].to_i*3600 + time_arr[1].to_i*60
    puts Time.at(total_seconds).utc
  end
end
