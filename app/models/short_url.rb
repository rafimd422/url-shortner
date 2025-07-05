class ShortUrl < ApplicationRecord
  # Validate presence of the original URL and ensure it matches HTTP or HTTPS format
  validates :original_url, presence: true, format: URI::regexp(%w[http https])

  # Ensure the generated short_code is unique to avoid collisions
  validates :short_code, uniqueness: true

  # Before validation on create, generate a unique short_code
  before_validation :generate_short_code, on: :create

  private

  # Generates a unique 6-character alphanumeric short code
  # Loops until a code is found that does not already exist in the database
  def generate_short_code
    return if short_code.present?

    loop do
      self.short_code = SecureRandom.alphanumeric(6)
      break unless ShortUrl.exists?(short_code: short_code)
    end
    
  end

end
