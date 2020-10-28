module SessionsHelper
    def sign_in(account)
        session[:account_id] = account.id
    end

    def sign_out
        session.delete(:account_id)
    end

    def current_user
        @current_user ||= Account.find_by(id: session[:account_id])
    end

    def user_signed_in?
        !current_user.nil?
    end
end