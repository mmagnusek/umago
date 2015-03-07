class AdminController < ApplicationController
  http_basic_authenticate_with name: 'umago', password: 'smrcinas'

end
