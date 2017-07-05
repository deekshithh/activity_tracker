require 'test_helper'

class TactivitiesControllerTest < ActionController::TestCase
  setup do
    @tactivity = tactivities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tactivities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tactivity" do
    assert_difference('Tactivity.count') do
      post :create, tactivity: { begins_at: @tactivity.begins_at, description: @tactivity.description, ends_at: @tactivity.ends_at, name: @tactivity.name }
    end

    assert_redirected_to tactivity_path(assigns(:tactivity))
  end

  test "should show tactivity" do
    get :show, id: @tactivity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tactivity
    assert_response :success
  end

  test "should update tactivity" do
    patch :update, id: @tactivity, tactivity: { begins_at: @tactivity.begins_at, description: @tactivity.description, ends_at: @tactivity.ends_at, name: @tactivity.name }
    assert_redirected_to tactivity_path(assigns(:tactivity))
  end

  test "should destroy tactivity" do
    assert_difference('Tactivity.count', -1) do
      delete :destroy, id: @tactivity
    end

    assert_redirected_to tactivities_path
  end
end
