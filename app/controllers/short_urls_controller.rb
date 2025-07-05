class ShortUrlsController < ApplicationController
  def new
    @short_url = ShortUrl.new
  end

  def create
    @short_url = ShortUrl.find_or_initialize_by(original_url: params[:short_url][:original_url])

if @short_url.save
  redirect_to short_url_display_path(@short_url.short_code)
else
  flash.now[:alert] = "Invalid URL"
  render :new
end

  end

  def show
    short_code = params[:short_code]
    short_url = ShortUrl.find_by(short_code: short_code)

    if short_url
      redirect_to short_url.original_url, allow_other_host: true
    else
      render plain: "URL not found", status: :not_found
    end
  end

  def display
  @short_url = ShortUrl.find_by(short_code: params[:short_code])
  unless @short_url
    render plain: "URL not found", status: :not_found
  end
end

end
