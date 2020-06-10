class AddExpirationTimeToJwtDenylist < ActiveRecord::Migration[5.2]
  def change
    add_column :jwt_denylist, :exp, :datetime, null: false
  end
end