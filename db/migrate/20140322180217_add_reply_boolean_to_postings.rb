class AddReplyBooleanToPostings < ActiveRecord::Migration
  def change
    add_column :postings, :reply, :boolean
  end
end
