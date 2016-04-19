class SalesController < WebServiceController

  def index # Show all the Sales
    render json: Sale.all
  end

  def show # Show a single Sale by 'id'
    id = nil # Hint: look at the 'params' hash
    sale = Sale.find id
    render json: sale
  end

  def create
    # Hint: check if your newly created sale is valid
    #       by checking sale.valid? and looking at the
    #       sale.errors array in the debugger
    sale = Sale.new sale_params
    sale.save

    render json: sale
  end

  private

  def sale_params
    params.require(:sale).permit!
  end

end
