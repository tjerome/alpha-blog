require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test 'get new category from and create category' do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: "books"}
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "invalid category submission result in failure" do


  end
end
