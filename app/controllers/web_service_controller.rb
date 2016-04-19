class WebServiceController < ApplicationController
  # Our web service controllers only offer JSON response bodies
  respond_to :json

  rescue_from ActionView::MissingTemplate do
    raise 'No call to #render'
  end
end
