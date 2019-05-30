require 'rails_helper'

RSpec.describe Category, :type => :model do
  subject { Category.new } 
  it 'should be valid' do
    subject.name = 'sports'
    expect(subject).to be_valid
  end

  context "its column name" do
    it 'must be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  
    it 'should be unique' do
      subject.name = 'sports'
      subject.save
      category2 = Category.new(name: 'sports')
      expect(category2).to_not be_valid 
    end
  end
  
end
