class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    puts params
    @messages = Message.all
  end

  def answer
    
    if params["q"] === "Ping"
      render plain: "OK"
    elsif params["q"] === "Email Address"
      render plain: "me@ilyamakovoz.com"
    elsif params["q"] === "Resume"
      render plain: "https://www.docdroid.net/o3lqJZO/ilya-makovoz-resume.pdf"
    elsif params["q"] === "Years"
      render plain: "1+"
    elsif params["q"] === "Status"
      render plain: "Yes"
    elsif params["q"] === "Name"
      render plain: "Ilya Makovoz"
    elsif params["q"] === "Phone"
      render plain: "1 203 321 5503"
    elsif params["q"] === "Referrer"
      render plain: "LinkedIn"
    elsif params["q"] === "Source"
      render plain: "https://github.com/imakovoz/emxCode"
    elsif params["q"] === "Degree"
      render plain: "NYU - Gallatin (Behavioral Economics), AppAcademy"
    elsif params["q"] === "Position"
      render plain: "TBD"
    elsif params["q"] === "Puzzle"
      render plain: "ABCD"
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:subject, :body)
    end
end
