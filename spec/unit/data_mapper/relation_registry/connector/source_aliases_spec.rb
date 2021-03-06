require 'spec_helper'

describe RelationRegistry::Connector, '#source_aliases' do
  subject { object.source_aliases }

  let(:object) { described_class.new(name, node, relationship, relations) }

  let(:name)            { :users_X_addresses }
  let(:node)            { mock('relation_node', :name => name) }
  let(:relationship)    { mock('relationship', :source_model => source_model, :target_model => target_model) }
  let(:source_model)    { mock_model(:User) }
  let(:target_model)    { mock_model(:Address) }
  let(:relations)       { mock('relations', :users => source_relation) }
  let(:source_relation) { mock('users_relation', :aliases => {}) }
  let(:source_mapper)   { mock_mapper(source_model) }
  let(:target_mapper)   { mock_mapper(target_model) }

  before { Mapper.mapper_registry << source_mapper << target_mapper }

  before { relations.should_receive(:[]).with(:users).and_return(source_relation) }

  it { should be(source_relation.aliases) }
end
