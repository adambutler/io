class CreateActivity < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :identity_id
      t.string :uid
      t.text :data
    end
  end
end
