class ResourceAssociation < ActiveRecord::Base
  belongs_to :resource
  belongs_to :association, :polymorphic => true
end
