class CreateTwits < ActiveRecord::Migration
  def change
    create_table :twits do |t|
      t.column :twit, :string

      t.timestamps
    end
  end
end
