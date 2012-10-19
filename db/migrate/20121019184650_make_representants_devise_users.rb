class MakeRepresentantsDeviseUsers < ActiveRecord::Migration
  def up
    # authenticable
    add_column :representants, :encrypted_password, :string, :null => false, :default => ""

    # recoverable
    add_column :representants, :reset_password_token, :string
    add_column :representants, :reset_password_sent_at, :datetime

    # rememberable
    add_column :representants, :remember_created_at, :datetime

    # trackable
    add_column :representants, :sign_in_count, :integer, :default => 0
    add_column :representants, :current_sign_in_at, :datetime
    add_column :representants, :last_sign_in_at, :datetime
    add_column :representants, :current_sign_in_ip, :string
    add_column :representants, :last_sign_in_ip, :string
  end

  def down
    remove_column :representants, :encrypted_password
    remove_column :representants, :reset_password_token
    remove_column :representants, :reset_password_sent_at
    remove_column :representants, :remember_created_at
    remove_column :representants, :sign_in_count
    remove_column :representants, :current_sign_in_at
    remove_column :representants, :last_sign_in_at
    remove_column :representants, :current_sign_in_ip
    remove_column :representants, :last_sign_in_ip
  end
end
