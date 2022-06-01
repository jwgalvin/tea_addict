class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.string :price
      t.boolean :status
      t.string :frequency
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
