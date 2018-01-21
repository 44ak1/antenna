class FeedsController < ApplicationController
  before_action :set_archives, only: [:show]

  MAX_FEEDS = 10

  def show
  end

  private

  def category
    return nil if params[:category] == 'all'
    return nil if params[:category] == 'nonadult'
    params[:category]
  end

  def safety
    return nil if params[:category] == 'all'
    return nil if params[:category] == 'adult'
    true
  end

  def set_archives
    clause = {
      'sites.category_code': category,
      is_safety: safety,
    }.compact
    @archives = Archive.where(clause).active.joins(:site).merge(Site.active).take(MAX_FEEDS)
  end
end
