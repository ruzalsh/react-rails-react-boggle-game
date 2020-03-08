class CreateScore < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :score
    end
  end
end
