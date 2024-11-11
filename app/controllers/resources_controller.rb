class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end
 
  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      redirect_to resources_path, notice: 'Programming language was successfully added.'
    else
      render :new
    end
  end

  def destroy
    if request.delete?  # Manually check if the request is a DELETE
      resource = Resource.find_by(id: params[:id])
  
      if resource
        sql = "DELETE FROM resources WHERE id = ?"
        ActiveRecord::Base.connection.execute(ActiveRecord::Base.send(:sanitize_sql_array, [sql, params[:id]]))
        redirect_to resources_path, notice: 'Programming language was successfully deleted.'
      else
        redirect_to resources_path, alert: 'Resource not found.'
      end
    else
      redirect_to resources_path, alert: 'Invalid request method.'
    end
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def edit
    @resource = Resource.find(params[:id])
  end
  
  def update
    @resource = Resource.find(params[:id])
    if @resource.update(resource_params)
      redirect_to resource_path(@resource), notice: 'Programming language was successfully updated.'
    else
      render :edit
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :description, :link)
  end
end
