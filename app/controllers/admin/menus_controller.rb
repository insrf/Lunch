class Admin::MenusController < Admin::BaseAdminController
  before_action :find_menus, only: %i[index]
  before_action :find_menu, only: %i[show edit update destroy]

  def index
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to [:admin, @menu], notice: "Your menu successfully created."
    else
      render :new
    end
  end

  def update
    if @menu.update(menu_params)
      redirect_to [:admin, @menu], notice: "Your menu successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @menu.destroy
    redirect_to admin_menus_path, notice: "Your menu successfully deleted"
  end

  private

  def menu_params
    params.require(:menu).permit(item_ids: [])
  end

  def find_menus
    @menus = Menu.all
  end

  def find_menu
    @menu = Menu.find(params[:id])
  end
end
