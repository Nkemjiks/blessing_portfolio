class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUser
  include PageTitle
end
