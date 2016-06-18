class BoardsController < ApplicationController
  # the index page doesn't require the user to be logged
  skip_before_filter :authenticate_user, only: [:index]

  def index
    current_user
  end
end
