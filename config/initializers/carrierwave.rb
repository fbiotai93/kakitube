CarrierWave.configure do |config|
  config.storage = :fog
	config.fog_credentials = {
		:provider => 'AWS',
		:aws_access_key_id => Settings.s3.access_key_id,
		:aws_secret_access_key => Settings.s3.secret_access_key,
		:region	=> Settings.s3.region
	}
	config.fog_directory = Settings.s3.bucket # required
	config.fog_public = true # optional, defaults to true
	config.fog_attributes = {'Cache-Control'=>'max-age=315576000'} # optional, defaults to {}
	config.asset_host = Settings.image_host
	config.cache_dir = "#{Rails.root}/tmp/uploads"
end 