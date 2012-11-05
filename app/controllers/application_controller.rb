class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_domain

  private

  def check_domain
    redirect_to "http://dickeyxxx.com#{request.fullpath}", status: :moved_permanently if request.host == 'jeffdickey.info'
  end

end
