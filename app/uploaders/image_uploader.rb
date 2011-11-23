class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # process :resize_to_fill => [450, 300]

  version :facebook do
    process resize_to_limit: [150, 150]
  end

  version :small_thumb do
    process :resize_to_fill => [50, 50]
  end

  version :medium_thumb do
    process :resize_to_fill => [100, 100]
  end

  version :large_thumb do
    process :resize_to_fill => [200, 200]
  end

  version :banner do
    process :resize_to_limit => [549, 300]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    if original_filename
      @hash ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{file.basename.split('_').last}-#{@hash}.#{file.extension}"
    end
  end
end
