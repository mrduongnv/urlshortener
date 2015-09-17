class LinksController < ApplicationController
  before_action :set_link, only: [:show]

  def show
    if params[:slug]
      _slug = params[:slug]
      _slug = _slug.gsub('0', 'O')
      _slug = _slug.gsub('o', 'O')
      _slug = _slug.gsub('1', 'I')
      _slug = _slug.gsub('i', 'I')
      _slug = _slug.gsub('l', 'I')
      _slug = _slug.chars.sort.join
      @link = Link.find_by(_slug: _slug)
      if redirect_to @link.given_url
        @link.clicks += 1
        @link.save
      end
    else
      @link = Link.find(params[:id])
    end
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to root_path, notice: 'Link was successfully created.' }
        format.js
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_link
      _slug = params[:slug]
      _slug = _slug.gsub('0', 'O')
      _slug = _slug.gsub('o', 'O')
      _slug = _slug.gsub('1', 'I')
      _slug = _slug.gsub('i', 'I')
      _slug = _slug.gsub('l', 'I')
      _slug = _slug.chars.sort.join
       @link = Link.find_by(_slug: _slug)
    end

    def link_params
      params.require(:link).permit(:given_url)
    end
end
