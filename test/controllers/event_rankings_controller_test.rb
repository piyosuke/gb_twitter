require 'test_helper'

class EventRankingsControllerTest < ActionController::TestCase
  setup do
    @event_ranking = event_rankings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_rankings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_ranking" do
    assert_difference('EventRanking.count') do
      post :create, event_ranking: { event_count: @event_ranking.event_count, name: @event_ranking.name, rank: @event_ranking.rank, ranking: @event_ranking.ranking, total_contribution: @event_ranking.total_contribution, total_kill: @event_ranking.total_kill }
    end

    assert_redirected_to event_ranking_path(assigns(:event_ranking))
  end

  test "should show event_ranking" do
    get :show, id: @event_ranking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_ranking
    assert_response :success
  end

  test "should update event_ranking" do
    patch :update, id: @event_ranking, event_ranking: { event_count: @event_ranking.event_count, name: @event_ranking.name, rank: @event_ranking.rank, ranking: @event_ranking.ranking, total_contribution: @event_ranking.total_contribution, total_kill: @event_ranking.total_kill }
    assert_redirected_to event_ranking_path(assigns(:event_ranking))
  end

  test "should destroy event_ranking" do
    assert_difference('EventRanking.count', -1) do
      delete :destroy, id: @event_ranking
    end

    assert_redirected_to event_rankings_path
  end
end
