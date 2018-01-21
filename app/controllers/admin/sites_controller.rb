class Admin::SitesController < Admin::ApplicationController
  before_action :set_site, only: [:edit, :update, :destroy]
  before_action :set_sites, only: [:index]
  
  def index
  end

  def new
    @site = Site.new
  end

  def edit
  end

  def update
    @site.update_attributes!(site_params)
    redirect_to edit_admin_site_path(@site), notice: 'サイトを更新しました'
  rescue
    error_message = @site.errors.full_messages
    flash.now[:alert] = "サイトの更新に失敗しました。#{error_message}"
    render :edit
  end

  def create
    @site = Site.new(site_params)
    @site.save!
    redirect_to admin_sites_path, notice: 'サイトを登録しました'
  rescue
    error_message = @site.errors.full_messages
    flash.now[:alert] = "サイトの登録に失敗しました。#{error_message}"
    render :new
  end

  def destroy
    @site.destroy!
    redirect_to admin_sites_path, notice: 'サイトを削除しました'
  rescue
    error_message = @site.errors.full_messages
    flash.now[:alert] = "サイトの削除に失敗しました。#{error_message}"
    render :edit
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def set_sites
    @sites = Site.page(params[:page]).active
  end

  def site_params
    params.require(:site).permit(:name, :url, :rss_url, :email, :description, :category_code)
  end
end