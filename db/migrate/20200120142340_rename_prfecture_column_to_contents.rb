class RenamePrfectureColumnToContents < ActiveRecord::Migration[5.2]
  def change
    rename_column :contents, :prfecture, :prefecture
  end
end
