class AddImageToContent < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :image, :string
    add_column :contents, :prfecture, :string
    
  end
end
