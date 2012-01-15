require 'spec_helper'

class Page
  has_many :resource_associations, :as => :association
  has_many :resources, :through => :resource_associations
end

describe ResourceAssociation do
  let!(:resource) do
    Resource.new(:id => 1, :file => File.new(File.expand_path('../../uploads/refinery_is_awesome.txt', __FILE__)))
  end

  let!(:page) { Page.create!(:title => 'A page') }

  before do
    subject.resource = resource
    subject.association = page
    subject.save
    subject.reload
  end

  it "references a Resource" do
    subject.resource_id.should eq(1)
  end

  it "polymorphically references anything else" do
    page.resource_associations.should eq([subject])
  end

  it "acts as a delegate to the resource" do
    page.resources.should eq([resource])
  end
end
