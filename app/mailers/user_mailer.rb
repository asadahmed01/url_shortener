class UserMailer < ApplicationMailer

    def send_magic_link(user)
        @user = user
        magic_link =  @user.generate_token_for :magic_link

        base_url = Rails.application.config.action_mailer.default_url_options[:host]
        @magic_link_url = "#{base_url}/login?token=#{magic_link}"

        mail(
          to: @user.email,
          subject: "Your Magic Link to Log In"
        )
    end
end
