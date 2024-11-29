class CreateMyMonitors < ActiveRecord::Migration[8.0]
  def change
    create_table :my_monitors do |t|
      t.string :url
      t.integer :schedule_interval

      t.timestamps
    end
  end
end
