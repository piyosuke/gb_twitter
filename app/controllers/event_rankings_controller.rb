class EventRankingsController < ApplicationController
  before_action :set_event_ranking, only: [:show, :edit, :update, :destroy]

  # GET /event_rankings
  # GET /event_rankings.json
  def index
    @event_rankings = EventRanking.all
  end

  # GET /event_rankings/1
  # GET /event_rankings/1.json
  def show
  end

  # GET /event_rankings/new
  def new
    @event_ranking = EventRanking.new
  end

  # GET /event_rankings/1/edit
  def edit
  end

  # POST /event_rankings
  # POST /event_rankings.json
  def create
    @event_ranking = EventRanking.new(event_ranking_params)

    respond_to do |format|
      if @event_ranking.save
        format.html { redirect_to @event_ranking, notice: 'Event ranking was successfully created.' }
        format.json { render :show, status: :created, location: @event_ranking }
      else
        format.html { render :new }
        format.json { render json: @event_ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_rankings/1
  # PATCH/PUT /event_rankings/1.json
  def update
    respond_to do |format|
      if @event_ranking.update(event_ranking_params)
        format.html { redirect_to @event_ranking, notice: 'Event ranking was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_ranking }
      else
        format.html { render :edit }
        format.json { render json: @event_ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_rankings/1
  # DELETE /event_rankings/1.json
  def destroy
    @event_ranking.destroy
    respond_to do |format|
      format.html { redirect_to event_rankings_url, notice: 'Event ranking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_ranking
      @event_ranking = EventRanking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_ranking_params
      params.require(:event_ranking).permit(:event_count, :ranking, :name, :rank, :total_kill, :total_contribution)
    end
end
