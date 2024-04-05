class AddStatusToGenerateData < ActiveRecord::Migration[7.1]
  def change
    add_column :generate_numbers, :status, :integer, default: 1
  end
end
