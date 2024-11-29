require "test_helper"

class MyMonitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_monitor = my_monitors(:one)
  end

  test "should get index" do
    get my_monitors_url
    assert_response :success
  end

  test "should get new" do
    get new_my_monitor_url
    assert_response :success
  end

  test "should create my_monitor" do
    assert_difference("MyMonitor.count") do
      post my_monitors_url, params: { my_monitor: { schedule_interval: @my_monitor.schedule_interval, url: @my_monitor.url } }
    end

    assert_redirected_to my_monitor_url(MyMonitor.last)
  end

  test "should show my_monitor" do
    get my_monitor_url(@my_monitor)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_monitor_url(@my_monitor)
    assert_response :success
  end

  test "should update my_monitor" do
    patch my_monitor_url(@my_monitor), params: { my_monitor: { schedule_interval: @my_monitor.schedule_interval, url: @my_monitor.url } }
    assert_redirected_to my_monitor_url(@my_monitor)
  end

  test "should destroy my_monitor" do
    assert_difference("MyMonitor.count", -1) do
      delete my_monitor_url(@my_monitor)
    end

    assert_redirected_to my_monitors_url
  end
end
