class DashboardController < ApplicationController
  def show

  end

  def create
    if params[:notice]
      flash[:notice] = I18n.t("flash.dashboard.notice")
    elsif params[:alert]
      flash[:alert] = I18n.t("flash.dashboard.alert")
    elsif params[:redirect]
      flash[:notice] = I18n.t("flash.dashboard.redirect")
      redirect_to custom_dashboard_path and return
    end
    redirect_to root_path
  end

  def custom
    redirect_to root_path
  end

end
