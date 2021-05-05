require 'pagy'
require 'pagy/extras/headers'

class Api::V1::CategoriesController < ApplicationController
  include Pagy::Backend
  load_and_authorize_resource

  def index
    @q = Category.includes(:parent).ransack(params[:q])
    @pagy, @categories = pagy(Category.includes(:parent))
    pagy_headers_merge(@pagy)
  end

  def show
    @category = Category.find(params[:id])
  end
end
