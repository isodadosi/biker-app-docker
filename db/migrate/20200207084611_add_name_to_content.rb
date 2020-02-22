class AddNameToContent < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :name, :string
  end
end
