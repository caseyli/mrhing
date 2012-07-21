class ChangeBodyForComponentInstances < ActiveRecord::Migration
  def up
    change_column :news_posts, :body, :text
  end

  def down
    change_column :news_posts, :body, :string
  end
end
