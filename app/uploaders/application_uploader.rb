# CarrierWave::Uploader::Base を継承して、
# ImageUploader に定義されていた store_dir を ApplicationUploader に移行して、storage :file を指定
class ApplicationUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end