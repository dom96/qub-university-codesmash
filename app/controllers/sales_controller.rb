class SalesController < WebServiceController

  def index # Show all the Sales
    render json: Sale.all
  end

  def show # Show a single Sale by 'id'
    id = params["id"]
    sale = Sale.find id
    render json: sale
  end

  def create
    # Calculate the total price of the sale.
    sale_params["total"] = 0
    sale_params["items"].each do |value|
      sale_params["total"] += Sale.calcPrice(value)
    end

    sale = Sale.new sale_params
    sale.save

    render json: sale
  end

  private

  def sale_params
    params.require(:sale).permit!
  end

end
