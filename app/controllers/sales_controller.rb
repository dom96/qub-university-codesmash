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
    total = 0
    sale_params["items"].each do |value|
      total += value["price"].to_f
      # Calculate discounts
      if value.key? "discount"
        total -= value["discount"]["amount"].to_f
      end
    end
    sale_params["total"] = total

    sale = Sale.new sale_params

    if sale.valid?
      sale.save

      render json: sale
    else
      render nil
    end
    
  end

  private

  def sale_params
    params.require(:sale).permit!
  end

end
