class ReportsController < WebServiceController

  def total_sales
    total = 0
    Sale.all.each do |sale|
      total += sale.total
    end
    resp = { "number_of_sales" => Sale.all.count, "total" => total }
    render json: resp
  end

  def sales_per_item
    resp = { }
    Sale.all.each do |sale|
      sale["items"].each do |item|
        if !resp.key? item["name"]
          resp[item["name"]] = { "number_of_sales" => 0, "total" => 0 }
        end
        resp[item["name"]]["total"] += item["price"].to_f
        resp[item["name"]]["number_of_sales"] += 1
        if item.key? "discount"
          resp[item["name"]]["total"] -= item["discount"]["amount"].to_f
        end
      end
    end
    render json: resp

  end

end
