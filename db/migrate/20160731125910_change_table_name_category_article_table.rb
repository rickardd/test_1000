class ChangeTableNameCategoryArticleTable < ActiveRecord::Migration
  def change
    rename_table :article_categorieas, :article_categories
  end
end
