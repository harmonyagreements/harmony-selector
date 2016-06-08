# Rails 4 uses secret_key_base; this is here so that sessions are
# transparently upgraded, and can be deleted a while after deploying
# Rails 4.
Rails.application.config.secret_token = 'ef2efc9a8284bc0cf70955434bab1a6b89f250a15533e05ba1c6bb35a09217f47b4a81617fbc224e51bf695e705d7a3338505f5e573105cdb278c1d7c3dbd89f'
