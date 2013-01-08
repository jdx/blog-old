CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    hosts: Rails.env.production? ?  'http://content.jeffdickey.info': "http://#{ENV['S3_BUCKET']}.s3.amazonaws.com",
  }
  config.fog_directory = ENV['S3_BUCKET']
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'} if Rails.env.production?
end
if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end
