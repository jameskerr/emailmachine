class AddAssetHostToTemplates < ActiveRecord::Migration
  def change
  	add_column :templates, :asset_host, :string
  end
end
