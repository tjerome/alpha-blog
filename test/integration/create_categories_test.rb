require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup do
    @user = User.create(username: "john", email: "john@example.com", password: "pass123", admin: true)
  end

  test 'get new category from and create category' do
    sign_in_as(@user, "password")
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
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: " "}
  end
  assert_template 'categories/new'
  assert_select 'h2.panel-title'
  assert_select 'div.panel-body'
end
