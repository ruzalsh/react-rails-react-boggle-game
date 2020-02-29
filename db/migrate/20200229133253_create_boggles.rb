class CreateBoggles < ActiveRecord::Migration[6.0]
  def change
    create_table :boggles do |t|
      t.string :word
      t.string :alphabets_on_boggle
    end
  end
end
