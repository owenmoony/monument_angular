class Api::MonumentGroupsController < Api::BaseController
  before_action :check_owner, only: [:show, :update, :destroy]

  def index
    @monument_groups = current_user.monument_groups
  end

  def show
    @monument_group = monument_group
  end

  def create
    list = current_user.monument_groups.create!(safe_params)
    render json: list
  end

  def update
    monument_group.update_attributes(safe_params)
    render nothing: true
  end

  def destroy
    monument_group.destroy
    render nothing: true
  end

  private
  def check_owner
    permission_denied if current_user != monument_group.owner
  end

  def monument_group
    @monument_group ||= MonumentGroup.find(params[:id])    
  end

  def safe_params
    params.require(:monument_group).permit(:name)
  end
end
