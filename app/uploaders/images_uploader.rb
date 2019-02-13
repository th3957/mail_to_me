class ImagesUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::Magic
  process :set_magic_content_type => [true]

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_limit: [2000, 2000]

  version :thumb do
    process resize_to_fill: [300, 300]
  end

  def size_range
    1..5.megabytes
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
