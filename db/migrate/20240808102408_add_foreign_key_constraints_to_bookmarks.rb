class AddForeignKeyConstraintsToBookmarks < ActiveRecord::Migration[7.1]
  def change
    # On retire les contraintes existantes si elles existent déjà
    remove_foreign_key :bookmarks, :movies if foreign_key_exists?(:bookmarks, :movies)

    # On ajoute une nouvelle contrainte avec ON DELETE RESTRICT
    add_foreign_key :bookmarks, :movies, on_delete: :restrict
  end
end
