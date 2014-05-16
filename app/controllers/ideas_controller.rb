class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :send_sms]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :send_sms]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  def send_sms
      @idea = Idea.find(params[:id])
      $client.account.messages.create(
      :from => '+14378000532',
      :to => '+16477025165',
      :body => @idea.title + ' ' + @idea.description + @idea.link
    )
    redirect_to @idea, notice: 'Text message successfully sent.'
  end
  # GET /ideas/1
  # GET /ideas/1.json
  def show   
  end

  # GET /ideas/new
  def new
    #current_user is a devise method
    @idea = current_user.ideas.build
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = current_user.ideas.build(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def correct_user
      @idea = current_user.ideas.find_by(id: params[:id])
      redirect_to ideas_path, notice: "Not authorized to edit this idea" if @idea.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :description, :link)
    end
end
