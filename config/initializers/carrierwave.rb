#if Rails.env.test? or Rails.env.cucumber?
#  CarrierWave.configure do |config|
#    config.storage = :file
#    config.enable_processing = false
#  end
#end

CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'

  config.s3_access_key_id = ENV['AMAZON_ACCESS_KEY_ID']
  config.s3_secret_access_key = ENV['AMAZON_SECRET_ACCESS_KEY']
  config.s3_bucket = 'mizukiupload'
end
