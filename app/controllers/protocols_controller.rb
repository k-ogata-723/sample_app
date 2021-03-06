class ProtocolsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :show, :update]
  before_action :set_protocol, only: [:destroy, :show]
  helper_method :home_protocols

  def index
  end

  # def home_protocols(micropost_id)
  #   feed_protocol(micropost_id).first
  # end

  def create
    @protocol = Protocol.new(protocol_params)
    if @protocol.save
      flash[:success] = "Protocol created!"
      render json: @protocol
    else
    end
  end

  def show
    protocols = Protocol.find(:params[:id])
    render json: protocols
  end

  def update
    @protocol = Protocol.find(params[:id])
    @protocol.update(protocol_params)

    render json: @protocol
  end

  private

    def protocol_params
      params.require(:protocol).permit(:procedure, :micropost_id)
    end

    def set_protocol
    end
  end
