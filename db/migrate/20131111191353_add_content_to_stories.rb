class AddContentToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :content, :text
  	add_column :stories, :location, :string
  end
end
