class CreateExpertHeadings < ActiveRecord::Migration[6.0]
  def change
    create_table :expert_headings do |t|
      t.integer :expert_id
      t.string :heading_type
      t.string :value

      t.timestamps
    end
  end
end
