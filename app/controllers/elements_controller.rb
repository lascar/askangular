class ElementsController < ApplicationController
  def index
    @elements = if params[:keywords]
                 Element.where('name ilike ?',"%#{params[:keywords]}%")
               else
                 []
               end
  end
end
