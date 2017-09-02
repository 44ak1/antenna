class ArchivesController < ApplicationController

  def index
    @archives = Archive.all
  end

  def show
    @archive = Archive.find(params[:id])
  end
end
