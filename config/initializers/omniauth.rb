Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "287814087908225", "c1984d555b20012fbcc394955d5a3a50",
      {:scope => 'email, offline_access', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}} 
end