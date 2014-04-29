class AddIndexesToDocuments < ActiveRecord::Migration
  def self.up
    add_index :documents, :category_id, {:name => "documents_category_id_index"}
    add_index :documents, :user_id, {:name => "documents_user_id_index"}
  end

  def self.down
    remove_index :documents, :documents_category_id_index
    remove_index :documents, :documents_user_id_index
  end
end
