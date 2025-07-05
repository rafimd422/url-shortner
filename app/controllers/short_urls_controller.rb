class ShortUrlsController < ApplicationController
  # Render form to input a new URL for shortening
  def new

    @short_url = ShortUrl.new
  
  end

  # Create or find a ShortUrl record for the given original URL
  # If saved successfully, redirect to display page showing the short URL
  # Otherwise, re-render the form with an error message
  def create

    @short_url = ShortUrl.find_or_initialize_by(original_url: params[:short_url][:original_url])

    if @short_url.save
      redirect_to short_url_display_path(@short_url.short_code)
    else
      flash.now[:alert] = "Invalid URL"
      render :new
    end

  end

  # Redirect short URL requests to the original URL
  # If the short code does not exist, render 404 text response
  def show

    short_code = params[:short_code]
    short_url = ShortUrl.find_by(short_code: short_code)

    if short_url
      redirect_to short_url.original_url, allow_other_host: true
    else
      render plain: "URL not found", status: :not_found
    end

  end

  # Display the shortened URL page with the short code and original URL
  # If the short code does not exist, render 404 text response
  def display

    @short_url = ShortUrl.find_by(short_code: params[:short_code])
    unless @short_url
      render plain: "URL not found", status: :not_found
    end
  end
  
end
