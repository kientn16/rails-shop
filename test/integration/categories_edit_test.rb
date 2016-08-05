require 'test_helper'

class CategoriesEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @cate = Category(:michael)
  end

  test "unsuccessful edit" do
    get edit_category_path(@cate)
    assert_template 'categories/edit'
    patch
  end
end
