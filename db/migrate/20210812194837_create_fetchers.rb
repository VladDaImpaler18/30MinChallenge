class CreateFetchers < ActiveRecord::Migration[6.0]
  def change
    create_table :fetchers do |t|
      t.string :service

      t.timestamps
    end
  end
end
