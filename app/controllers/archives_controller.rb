class ArchivesController < ApplicationController
  before_action :set_archives, only: [:index, :pickups]
  before_action :set_archive, only: :show

  def index
  end

  def pickups
    @archives = @archives.pickups
    render action: :index
  end

  def show
    @archives = Archive.active.joins(:site).merge(Site.active)
  end

  private

  def category
    return nil if params[:category] == 'nonadult'
    params[:category]
  end

  def safety
    return false if params[:category] == 'adult'
    true
  end

  def set_archives
    clause = {
      'sites.name': params[:site],
      'sites.category_code': category,
      is_safety: safety,
    }.compact
    @archives = Archive.where(clause).page(params[:page]).active.joins(:site).merge(Site.active)
  end

  def set_archive
    @archive = Archive.find_by!(uuid: params[:uuid])
  end
end
