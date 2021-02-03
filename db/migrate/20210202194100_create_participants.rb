class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.integer :survey_id
      t.integer :user_id
      t.integer :unique_id
      t.timestamps
    end
  end
end
