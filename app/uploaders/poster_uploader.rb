# encoding: utf-8

class PosterUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  include CarrierWave::MimeTypes
  include ::CarrierWave::Backgrounder::Delay

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # def default_url
  #   "http://#{fog_directory}.s3-website-ap-southeast-1.amazonaws.com/#{store_dir}/#{version_name}.jpg"
  # end

  process :set_content_type
  process :convert => 'jpg'

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  version :standard do
    process :resize_to_fill => [300, 473]
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [233, 290]
  end

  version :avatar do
    process :resize_to_fill => [64, 83]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

  # def filename
  #   "#{secure_token}.jpg" if original_filename
  # end

  # protected

  # def secure_token
  #   var = :"@#{mounted_as}_secure_token"
  #   model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(2))
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end

# module CarrierWave
#   module Uploader
#     module Versions
#       def full_filename(for_file)
#         parent_name = super(for_file)
#         ext         = File.extname(parent_name)
#         base_name   = parent_name.chomp(ext)
#         [base_name, version_name].compact.join('_') + ext
#       end

#       def full_original_filename
#         parent_name = super
#         ext         = File.extname(parent_name)
#         base_name   = parent_name.chomp(ext)
#         [base_name, version_name].compact.join('_') + ext
#       end
#     end
#   end
# end
