# SQLite creation query
# CREATE TABLE appointment_settings(
#   id INTEGER NOT NULL PRIMARY KEY,
#   title TEXT, url TEXT, ref TEXT,
#   created_at DATETIME,
#   updated_at DATETIME
# );
class AppointmentSetting < Crecto::Model
  schema "appointment_settings" do
    field :title, String
    field :url, String
    field :ref, String
  end

  validate_required [:title, :url, :ref]
  validate_format [:title, :url], /^.+$/
  validate_format :ref, /^[0-9]+$/
end
