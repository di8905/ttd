class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to [:admin, @route], notiсe: t('admin.routes.notice.created')
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @route.update(route_params)
      redirect_to [:admin, @route], notice: t('admin.routes.notice.updated')
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path, notice: t('admin.routes.notice.deleted')
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, railway_station_ids: [])
  end
end
