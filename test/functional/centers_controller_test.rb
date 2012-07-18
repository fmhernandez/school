# -*- encoding : utf-8 -*-
require 'test_helper'

class CentersControllerTest < ActionController::TestCase
  setup do
    @center = centers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:centers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create center" do
    assert_difference('Center.count') do
      post :create, :center => @center.attributes
    end

    assert_redirected_to center_path(assigns(:center))
  end

  test "should show center" do
    get :show, :id => @center.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @center.to_param
    assert_response :success
  end

  test "should update center" do
    put :update, :id => @center.to_param, :center => @center.attributes
    assert_redirected_to center_path(assigns(:center))
  end

  test "should destroy center" do
    assert_difference('Center.count', -1) do
      delete :destroy, :id => @center.to_param
    end

    assert_redirected_to centers_path
  end
end
