require "kemal"

require "sqlite3"
require "crecto"
require "kemal-csrf"

require "./verif-rdv-pref/*"
require "./verif-rdv-pref/actions/*"
require "./verif-rdv-pref/models/*"

module VerifRdvPref
  add_handler CSRF.new
end
