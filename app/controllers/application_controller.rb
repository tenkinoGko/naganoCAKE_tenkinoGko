class ApplicationController < ActionController::Base
  # Devise after_sign_in_path_forオーバーライド
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path # 管理者ログイン後のリダイレクト先
    else
      root_path # 顧客ログイン後のリダイレクト先
    end
  end
  
  before_action :set_genres

  private

  def set_genres
    @genres = Genre.all
  end
  
end
