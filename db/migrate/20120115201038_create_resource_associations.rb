class CreateResourceAssociations < ActiveRecord::Migration
  def self.up
    create_table :resource_associations do |t|
      t.references :resource
      t.references :association, :polymorphic => true
    end
    add_index :resource_associations, :resource_id
    add_index :resource_associations, :association_id
    add_index :resource_associations, :association_type
  end

  def self.down
    drop_table :resource_associations
  end
end
