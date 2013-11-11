class DropTable < ActiveRecord::Migration

  def down
  	drop_table :onetime_development
  	drop_table :onetime_test
  end
end
