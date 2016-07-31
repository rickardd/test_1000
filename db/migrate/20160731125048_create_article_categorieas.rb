class CreateArticleCategorieas < ActiveRecord::Migration
  def change
    create_table :article_categorieas do |t|
      t.integer :article_id
      t.integer :category_id
    end
  end
end
