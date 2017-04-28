class RemoveStringFromDojos < ActiveRecord::Migration
  def change
    remove_column :dojos, :string, :string
    remove_column :dojos, :string, :string
  end
end
