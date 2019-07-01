class Admin::ItemsController < Admin::BaseAdminController
  before_action :find_items, only: %i[index]
  before_action :find_item, only: %i[show edit update destroy]

  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to [:admin, @item], notice: "Your item successfully created."
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to [:admin, @item], notice: "Your item successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_items_path, notice: "Your item successfully deleted"
  end

  private

  def item_params
    params.require(:item).permit(:name, :course_type, :price, :photo)
  end

  def find_items
    @items = Item.all
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
