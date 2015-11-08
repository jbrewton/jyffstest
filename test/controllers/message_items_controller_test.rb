require 'test_helper'

class MessageItemsControllerTest < ActionController::TestCase
  setup do
    @message_item = message_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:message_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message_item" do
    assert_difference('MessageItem.count') do
      post :create, message_item: { message: @message_item.message }
    end

    assert_redirected_to message_item_path(assigns(:message_item))
  end

  test "should show message_item" do
    get :show, id: @message_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message_item
    assert_response :success
  end

  test "should update message_item" do
    patch :update, id: @message_item, message_item: { message: @message_item.message }
    assert_redirected_to message_item_path(assigns(:message_item))
  end

  test "should destroy message_item" do
    assert_difference('MessageItem.count', -1) do
      delete :destroy, id: @message_item
    end

    assert_redirected_to message_items_path
  end
end
