class ReportsController < WebServiceController

  def total_sales
    resp = { "number_of_sales" => Sale.count, "total" => Sale.sum(:total) }
    render json: resp
  end

  def sales_per_item
    resp = { }
    Sale.all.each do |sale|
      sale["items"].each do |item|
        if !resp.key? item["name"]
          resp[item["name"]] = { "number_of_sales" => 0, "total" => 0 }
        end
        resp[item["name"]]["number_of_sales"] += 1
        resp[item["name"]]["total"] += Sale.calcPrice(item)
      end
    end
    render json: resp
  end

end
