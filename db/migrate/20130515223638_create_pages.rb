class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :title
      t.text   :content

      t.string :meta_title
      t.text   :meta_description

      t.references :parent

      t.references :locale, :null => false, :default => 0

      t.timestamps
      t.datetime :published_at
      t.datetime :deleted_at
    end

    add_index :pages, :name, :unique => true
  end
end
