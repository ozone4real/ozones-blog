class CategoriesController < ApplicationController
  before_action :require_user, only: %w(create new)
  before_action :require_admin, only: %w(create new)
  def new
    @category = Category.new
  end

  def create
    name = params[:category][:name]
    name = name.strip.titlecase
    @category = Category.new(name: name)
    if @category.save
      return redirect_to categories_path
    end
    flash[:error] = @category.errors.full_messages[0]
    render "new"
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 7)
  end

  def show
    @category = Category.find(params[:id])
  end
end
