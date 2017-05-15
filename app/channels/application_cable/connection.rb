module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user_from_env
    end

    private

    def find_verified_user_from_env
      current_user = env['warden'].user
      if current_user
        current_user
      else
        reject_unauthorized_connection
      end
    end

  end
end
