require 'spec_helper'

describe AliasSet, '#attributes' do
  subject { object.attributes }

  let(:prefix) { :songs }

  context 'with no attributes passed to #initialize' do
    let(:object) { described_class.new(prefix) }

    it { should == Mapper::AttributeSet.new }
  end

  context 'with attributes passed to #initialize' do
    let(:object)     { described_class.new(prefix, attributes)        }
    let(:attributes) { Mapper::AttributeSet.new << attribute          }
    let(:attribute)  { Mapper::Attribute.build(:id, :type => Integer) }

    it { should == attributes }
  end
end
