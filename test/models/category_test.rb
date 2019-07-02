require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "sports")
  end

  test "Category should be valid" do
    assert @category.valid?
  end

  test "name must be valid" do
    @category.name = ""
    assert_not @category.valid?
  end

  test "name must be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end
end
