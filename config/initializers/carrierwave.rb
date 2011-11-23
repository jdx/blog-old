CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => "AWS",
    :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
  }
  config.fog_directory = ENV['S3_BUCKET']
  config.fog_host = "http://#{ENV['S3_BUCKET']}.s3.amazonaws.com"
  if Rails.env.production?
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
    config.fog_host = 'http://content.jeffdickey.info'
  end
end
if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end
