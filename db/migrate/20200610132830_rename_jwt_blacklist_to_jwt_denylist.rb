class RenameJwtBlacklistToJwtDenylist < ActiveRecord::Migration[5.2]
  def change
    rename_table :jwt_blacklist, :jwt_denylist
  end 
end