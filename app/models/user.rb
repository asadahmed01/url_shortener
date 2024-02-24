class User < ApplicationRecord

  generates_token_for :magic_link, expires_in: 15.minutes do
    last_sign_in_at
  end
end
