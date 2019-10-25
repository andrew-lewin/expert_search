require 'test_helper'

class ExpertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expert = experts(:one)
  end

  test "should get index" do
    get experts_url
    assert_response :success
  end

  test "should get new" do
    get new_expert_url
    assert_response :success
  end

  test "should create expert" do
    ShortURL.expects(:shorten).returns("http://short.url")
    ExpertHeading.expects(:create).returns(true).times(10)

    assert_difference('Expert.count') do
      post experts_url, params: { expert: { name: @expert.name, personal_website_url: @expert.personal_website_url, shortend_url: @expert.shortend_url } }
    end

    expert = Expert.last

    assert_redirected_to expert_url(expert)
    assert expert.shortend_url == "http://short.url"
  end

  test "should show expert" do
    get expert_url(@expert)
    assert_response :success
  end

  test "should get edit" do
    get edit_expert_url(@expert)
    assert_response :success
  end

  test "should update expert" do
    patch expert_url(@expert), params: { expert: { name: @expert.name, personal_website_url: @expert.personal_website_url, shortend_url: @expert.shortend_url } }
    assert_redirected_to expert_url(@expert)
  end

  test "should destroy expert" do
    assert_difference('Expert.count', -1) do
      delete expert_url(@expert)
    end

    assert_redirected_to experts_url
  end
end
