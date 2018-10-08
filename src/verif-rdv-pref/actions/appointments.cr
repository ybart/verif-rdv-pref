require "ecr"

module VerifRdvPref::Actions
  before_all do |env|
    env.response.headers["Content-Type"] = "text/html; charset=UTF-8"
  end

  get "/appointment_settings" do
    appointment_settings = Repo.all(AppointmentSetting) # TODO: Pagination
    render_view "appointment_settings/index"
  end

  get "/appointment_setting/:id" do |env|
    appointment_setting = Repo.get(AppointmentSetting, env.params.url["id"])

    if appointment_setting
      appointment_setting.as(AppointmentSetting)
      render_view "appointment_settings/show"
    end
  end

  get "/appointment_settings/new" do |env|
    errors = nil
    render_view "appointment_settings/form"
  end

  post "/appointment_settings" do |env|
    title = env.params.body["title"]?.as(String)
    url = env.params.body["url"]?.as(String)
    ref = env.params.body["ref"]?.as(String)
    errors = nil

    appointment_setting = AppointmentSetting.new
    appointment_setting.title = title
    appointment_setting.url = url
    appointment_setting.ref = ref

    changeset = AppointmentSetting.changeset(appointment_setting)

    if changeset.valid?
      changeset = Repo.insert(appointment_setting)
      env.redirect "/appointment_setting/#{changeset.instance.id}"
    else
      errors = changeset.errors
      render_view "appointment_settings/form"
    end
  end
end
