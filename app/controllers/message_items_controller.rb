class MessageItemsController < ApplicationController
  before_action :set_message_item, only: [:show, :edit, :update, :destroy]

  # GET /message_items
  # GET /message_items.json
  def index
    @message_items = MessageItem.all
  end

  # POST /message_items
  # POST /message_items.json
  def create
    @message_item = MessageItem.new(message_item_params)
    @message_item.poster = Poster.where(name: params['message_item']['poster']).first_or_create unless params['message_item']['poster'].blank? 

    respond_to do |format|
      if @message_item.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @message_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_item
      @message_item = MessageItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_item_params
      params.require(:message_item).permit(:message)
    end
end
