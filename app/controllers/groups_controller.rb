class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
    @group = Group.find_by(params[:id])
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.users << User.where(id: params[:group][:user_ids])
      binding.pry
      redirect_to root_path, notice: "グループを作成しました"
    else
      render :new
    end
  end


  def edit
  end


  def update
    if @group.update(group_params)
      @group.users = User.where(id: params[:group][:user_ids])
      redirect_to group_messages_path(@group), notice: 'グループを編集しました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
