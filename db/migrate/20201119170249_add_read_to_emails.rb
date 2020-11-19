class AddReadToEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :emails, :read, :boolean
  end
end
