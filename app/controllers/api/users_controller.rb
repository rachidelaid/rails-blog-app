class Api::UsersController < ApplicationController
  def index
    json_response({ msg: 'welcome to our API' }, 400)
  end

  def show
    json_response({ msg: 'to see the posts add /posts' }, 400)
  end
end
