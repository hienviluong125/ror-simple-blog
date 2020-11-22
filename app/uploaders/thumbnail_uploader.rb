class ThumbnailUploader < CarrierWave::Uploader::Base
  if Rails.env.production?
    include Cloudinary::CarrierWave
  end

  if Rails.env.development?
    storage :file
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
