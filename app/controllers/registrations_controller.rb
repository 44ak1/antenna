class RegistrationsController < ApplicationController
  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.save!
    redirect_to finish_registration_path
  rescue
    error_message = @site.errors.full_messages
    flash.now[:alert] = "サイトの登録に失敗しました。#{error_message}"
    render :new
  end

  def finish
  end

  private

  def site_params
    params.require(:site).permit(:name, :url, :rss_url, :email, :category_code)
  end
end
