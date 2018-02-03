class WeeksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admincheck
  before_action :set_week, only: [:show, :edit, :update, :destroy]

  # GET /weeks
  # GET /weeks.json
  def index
    @weeks = @course.weeks
  end

  # GET /weeks/new
  def new
    @week = Week.new
  end

  # GET /weeks/1/edit
  def edit
  end

  # POST /weeks
  # POST /weeks.jso 
 def create
    #@week = Week.new(week_params.merge(course_id: @course.id))
    @week = Week.new(week_params)
    if @week.save
      redirect_to '/weeks'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /weeks/1
  # PATCH/PUT /weeks/1.json
  def update
    if @week.update(week_params)
      redirect_to '/weeks'
    else
      render action: 'edit'
    end
  end

  # DELETE /weeks/1
  # DELETE /weeks/1.json
  def destroy
    @week.destroy
    redirect_to '/weeks'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week
      @week = Week.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_params
      params.require(:week).permit(:start,:course_id)
       if @week_params[:start] != nil
        #@week_params[:start] = Date.new(@week_params[':start(1i)'].to_i, @week_params[':start(2i)'].to_i, @week_params['start(3i)'].to_i)
        @week_params[:start] = Date.parse(@week_params[:start]).to_s
       # if @start != nil  
       #@date = Date.new(@date(1i), @date(2i), @date(3i))
      #  @start = Date._parse(@start).to_s
       #@week_params[:start] = Date._parse(@week_params[:start]).to_s
       end

    end
end
