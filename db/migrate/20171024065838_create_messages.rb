class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.string :image
      t.references :user, foregin_key: :user_id, null: false
      t.references :group, foregin_key: :group_id, null: false
      t.timestamps
    end
  end
end
