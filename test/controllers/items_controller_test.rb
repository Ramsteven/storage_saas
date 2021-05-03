require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @box = boxes(:one)
    @item = items(:one)
  end

  test "should get index" do
    get :index, params: { box_id: @box }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { box_id: @box }
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, params: { box_id: @box, item: @item.attributes }
    end

    assert_redirected_to box_item_path(@box, Item.last)
  end

  test "should show item" do
    get :show, params: { box_id: @box, id: @item }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { box_id: @box, id: @item }
    assert_response :success
  end

  test "should update item" do
    put :update, params: { box_id: @box, id: @item, item: @item.attributes }
    assert_redirected_to box_item_path(@box, Item.last)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, params: { box_id: @box, id: @item }
    end

    assert_redirected_to box_items_path(@box)
  end
end
