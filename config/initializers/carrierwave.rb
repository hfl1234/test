CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = "hfl12345"
  config.upyun_password = 'hfl113916'
  config.upyun_bucket = "my_bucket"
  # upyun_bucket_domain 以后将会弃用，请改用 upyun_bucket_host
  # config.upyun_bucket_domain = "my_bucket.files.example.com"
  config.upyun_bucket_host = "hfl-upyun.b0.aicdn.com"
end