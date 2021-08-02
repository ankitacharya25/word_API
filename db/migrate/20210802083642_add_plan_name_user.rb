class AddPlanNameUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :plan_name, :string
  end
end
