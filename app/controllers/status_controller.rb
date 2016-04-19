class StatusController < WebServiceController

  def show
    render json: { status: 'Everything is working!' }
  end

end
