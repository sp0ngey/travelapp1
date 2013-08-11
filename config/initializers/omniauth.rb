Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity
  provider :facebook, '561632997226673', 'd1d39acf1e19ff006ed2a1afeae1a227'
end