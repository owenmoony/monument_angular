class Api::MonumentsController < Api::BaseController
  before_action :check_owner

  def index
    @monuments = group.monuments
  end

  def create
    @monument = group.monuments.create!(safe_params)
    render :show, status: :created
  end

  def update
    monument.update_attributes(safe_params)
    render nothing: true, status: :no_content
  end

  def destroy
    monument.destroy
    render nothing: true, status: :no_content
  end

  private
  def group
    @group ||= MonumentGroup.find(params[:monument_group_id])
  end

  def monument
    @monument ||= group.monuments.find(params[:id])
  end

  def safe_params
    params.require(:monument).permit(:description, :name)
  end

  def check_owner
    permission_denied if current_user != group.owner
  end
end
