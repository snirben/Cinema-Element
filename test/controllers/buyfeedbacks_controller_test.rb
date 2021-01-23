require 'test_helper'

class BuyfeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buyfeedback = buyfeedbacks(:one)
  end

  test "should get index" do
    get buyfeedbacks_url
    assert_response :success
  end

  test "should get new" do
    get new_buyfeedback_url
    assert_response :success
  end

  test "should create buyfeedback" do
    assert_difference('Buyfeedback.count') do
      post buyfeedbacks_url, params: { buyfeedback: {  } }
    end

    assert_redirected_to buyfeedback_url(Buyfeedback.last)
  end

  test "should show buyfeedback" do
    get buyfeedback_url(@buyfeedback)
    assert_response :success
  end

  test "should get edit" do
    get edit_buyfeedback_url(@buyfeedback)
    assert_response :success
  end

  test "should update buyfeedback" do
    patch buyfeedback_url(@buyfeedback), params: { buyfeedback: {  } }
    assert_redirected_to buyfeedback_url(@buyfeedback)
  end

  test "should destroy buyfeedback" do
    assert_difference('Buyfeedback.count', -1) do
      delete buyfeedback_url(@buyfeedback)
    end

    assert_redirected_to buyfeedbacks_url
  end
end
