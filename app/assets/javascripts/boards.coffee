# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.task_status_select').change ->
      task = $(this).closest("li")
      actual_status = task.closest("ul")
      board_id = actual_status.data("board-id")
      selected_val = $(this).val()
      board_to_append = ""
      switch selected_val
        when "1"
          board_to_append = "to_do_"
        when "2"
          board_to_append = "in_progress_"
        when "3"
          board_to_append = "to_verify_"
        when "4"
          board_to_append = "done_"
        else
          console.log "error"
      task.detach().appendTo("#"+board_to_append+board_id)



