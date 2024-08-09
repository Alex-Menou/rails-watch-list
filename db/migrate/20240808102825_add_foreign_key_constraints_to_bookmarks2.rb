class AddForeignKeyConstraintsToBookmarks2 < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :bookmarks, :movies if foreign_key_exists?(:bookmarks, :movies)
    remove_foreign_key :bookmarks, :lists if foreign_key_exists?(:bookmarks, :lists)

    add_foreign_key :bookmarks, :movies, on_delete: :restrict
    add_foreign_key :bookmarks, :lists, on_delete: :restrict
  end
end
