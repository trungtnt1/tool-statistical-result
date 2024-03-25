class LoteryManagerments < ActiveRecord::Migration[7.1]
  def change
    create_table :lottery_managements do |t|
      t.integer :lottery_ball_1, :null => false, comment: 'value 1->55'
      t.integer :lottery_ball_2, :null => false, comment: 'value 1->55'
      t.integer :lottery_ball_3, :null => false, comment: 'value 1->55'
      t.integer :lottery_ball_4, :null => false, comment: 'value 1->55'
      t.integer :lottery_ball_5, :null => false, comment: 'value 1->55'
      t.integer :lottery_ball_6, :null => false, comment: 'value 1->55'
      t.integer :lottery_ball_extra , comment: 'add when status is 6/55'
      t.integer :status, comment: '55 = 6/55 and 45 = 6/45'
      t.date :lottery_period, :null => false 
      t.integer :number_of_spins_per_week, :null => false 'value 1->3'
      t.timestamps
    end
  end
end
