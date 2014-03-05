class AddBodyToPostings < ActiveRecord::Migration
  def change
  	add_column :postings, :body, :text
  	remove_column :postings, :content, :string
  end
end
