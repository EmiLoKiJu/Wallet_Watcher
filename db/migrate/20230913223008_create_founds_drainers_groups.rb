class CreateFoundsDrainersGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :founds_drainers_groups do |t|
      t.references :founds_drainer, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
