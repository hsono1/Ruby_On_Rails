class RemoveStringFromNinja < ActiveRecord::Migration
  def change
    remove_column :ninjas, :string, :string
    remove_column :ninjas, :string, :string
  end
end
