Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook , '957c3669c5ec514fe0b895f9555f5eadda2fbaf5d5757a4a8c926d4f02b013f9', 'ddddc41aa306efd9361b5769bdafabc2d273e78af40cc3ba47b54eb9bd631f59'
end