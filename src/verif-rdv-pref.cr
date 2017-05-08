require "kemal"
require "./verif-rdv-pref/*"

module Verif::Rdv::Pref
  get "/" do
    "Hello World!"
  end

  Kemal.run
end
