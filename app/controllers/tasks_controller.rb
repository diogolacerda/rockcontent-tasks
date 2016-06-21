class TasksController < ApplicationController

  def change_status
    task = Task.find params[:id]
    task.update_attributes(task_status_id: params[:task_status_id])

    head :ok # this will return HTTP 200 OK to jQuery!
  end
end
