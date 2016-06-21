# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.task_status_select').change ->
      task = $(this).closest("li")
      task_id = task.data("task-id")
      actual_status = task.closest("ul")
      board_id = actual_status.data("board-id")
      status_id = $(this).val()

      $.ajax
        method: 'put'
        url: "tasks/"+task_id+"/change_status/"+status_id
        success: (data) ->
          move_task(task, board_id, status_id)



move_task = (task_to_move, board_id, status_id) ->
  board_to_append = "#"
  switch status_id
    when "1"
      board_to_append += "to_do_"+board_id
    when "2"
      board_to_append += "in_progress_"+board_id
    when "3"
      board_to_append += "to_verify_"+board_id
    when "4"
      board_to_append += "done_"+board_id
    else
      console.log "error"
  task_to_move.detach().appendTo(board_to_append)



