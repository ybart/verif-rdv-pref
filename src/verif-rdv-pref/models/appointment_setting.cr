class AppointmentSetting < Crecto::Model
  schema "appointment_settings" do
    field :title, String
    field :action, String
    field :url, String
    field :data, String
  end

  validate_required [:url, :action, :data]
end
