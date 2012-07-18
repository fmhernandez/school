# -*- encoding : utf-8 -*-
require 'test_helper'

class StudentClassesControllerTest < ActionController::TestCase
  setup do
    @student_class = student_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_class" do
    assert_difference('StudentClass.count') do
      post :create, :student_class => @student_class.attributes
    end

    assert_redirected_to student_class_path(assigns(:student_class))
  end

  test "should show student_class" do
    get :show, :id => @student_class.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @student_class.to_param
    assert_response :success
  end

  test "should update student_class" do
    put :update, :id => @student_class.to_param, :student_class => @student_class.attributes
    assert_redirected_to student_class_path(assigns(:student_class))
  end

  test "should destroy student_class" do
    assert_difference('StudentClass.count', -1) do
      delete :destroy, :id => @student_class.to_param
    end

    assert_redirected_to student_classes_path
  end
end
