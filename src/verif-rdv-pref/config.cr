macro render_view(filename)
  render "src/verif-rdv-pref/views/#{{{filename}}}.ecr"
end

Crecto::DbLogger.set_handler(STDOUT)

Session.config do |config|
  Session.config.secret = ENV["SECRET_KEY_BASE"]? || "not_so_secret_key_base"
end
