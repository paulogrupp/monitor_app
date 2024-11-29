class CreateMonitoringResults < ActiveRecord::Migration[8.0]
  def change
    create_table :monitoring_results do |t|
      t.references :my_monitor, null: false, foreign_key: true
      t.integer :response_time
      t.integer :status_code

      t.timestamps
    end
  end
end
