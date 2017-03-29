class RegistrationsController < Devise::RegistrationsController

  require 'sendgrid-ruby'
  include SendGrid

  def create
    # build_resource(sign_up_params)

    # resource.save
    # yield resource if block_given?
    # if resource.persisted?
    #   if resource.active_for_authentication?
    #     set_flash_message! :notice, :signed_up
    #     sign_up(resource_name, resource)
    #     respond_with resource, location: after_sign_up_path_for(resource)
    #   else
    #     set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
    #     expire_data_after_sign_in!
    #     respond_with resource, location: after_inactive_sign_up_path_for(resource)
    #   end
    # else
    #   clean_up_passwords resource
    #   set_minimum_password_length
    #   respond_with resource
    # end

    from = Email.new(email: 'paulyk1983@gmail.com')
    to = Email.new(email: "paul@finishlinecorp.com")
    subject = 'test email subject'

    message = "A user has signed up!"

    content = Content.new(type: 'text/html', value: message)
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])
    response = sg.client.mail._('send').post(request_body: mail.to_json)

    super
  end

end