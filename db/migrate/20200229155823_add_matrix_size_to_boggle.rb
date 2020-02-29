class AddMatrixSizeToBoggle < ActiveRecord::Migration[6.0]
  def change
    add_column :boggles, :matrix_size, :string
  end
end
