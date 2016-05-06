require "test_helper"

class CharactersRequestTest < ActionDispatch::IntegrationTest
  test "fetch characters when there is none" do
    get "/characters"

    assert_response :success
    assert_equal response.body, "[]"
  end

  test "fetch characters when there is some" do
    Character.create! name: "Eddard Stark"

    get "/characters"

    assert_response :success

    json_response = JSON.parse response.body
    assert_equal json_response.size, 1

    character = json_response.first
    assert_equal character.has_key?("id")
    assert_equal character.has_key?("name")
  end
end
