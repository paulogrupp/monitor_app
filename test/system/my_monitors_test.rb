require "application_system_test_case"

class MyMonitorsTest < ApplicationSystemTestCase
  setup do
    @my_monitor = my_monitors(:one)
  end

  test "visiting the index" do
    visit my_monitors_url
    assert_selector "h1", text: "My monitors"
  end

  test "should create my monitor" do
    visit my_monitors_url
    click_on "New my monitor"

    fill_in "Schedule interval", with: @my_monitor.schedule_interval
    fill_in "Url", with: @my_monitor.url
    click_on "Create My monitor"

    assert_text "My monitor was successfully created"
    click_on "Back"
  end

  test "should update My monitor" do
    visit my_monitor_url(@my_monitor)
    click_on "Edit this my monitor", match: :first

    fill_in "Schedule interval", with: @my_monitor.schedule_interval
    fill_in "Url", with: @my_monitor.url
    click_on "Update My monitor"

    assert_text "My monitor was successfully updated"
    click_on "Back"
  end

  test "should destroy My monitor" do
    visit my_monitor_url(@my_monitor)
    click_on "Destroy this my monitor", match: :first

    assert_text "My monitor was successfully destroyed"
  end
end
