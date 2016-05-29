class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def agreement_params
    params.require(:agreement).permit(:version, :projectname, :submission, :method, :nonowner, :grant, :option, :outbound, :media, :jurisdiction)
  end
end
