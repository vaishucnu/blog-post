class RemoveCompletedFromTodos < ActiveRecord::Migration[6.1]
  def change
    remove_column :todos, :completed, :boolean
  end
end
