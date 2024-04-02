class CreateGenerateNumbers < ActiveRecord::Migration[7.1]
  def change
    create_table :generate_numbers do |t|
      t.text :result
      t.string :jackpot_type
      t.timestamps
    end
  end
end
