# -*- encoding : utf-8 -*-
require 'test_helper'

class LoungesControllerTest < ActionController::TestCase
  setup do
    @lounge = lounges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lounges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lounge" do
    assert_difference('Lounge.count') do
      post :create, :lounge => @lounge.attributes
    end

    assert_redirected_to lounge_path(assigns(:lounge))
  end

  test "should show lounge" do
    get :show, :id => @lounge.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @lounge.to_param
    assert_response :success
  end

  test "should update lounge" do
    put :update, :id => @lounge.to_param, :lounge => @lounge.attributes
    assert_redirected_to lounge_path(assigns(:lounge))
  end

  test "should destroy lounge" do
    assert_difference('Lounge.count', -1) do
      delete :destroy, :id => @lounge.to_param
    end

    assert_redirected_to lounges_path
  end
end
