class ApplicationController < ActionController::Base
  # devise利用の機能（ユーザー登録等）が使われる前にonfigure_permitted_parametersメソッドが実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後にaboutページ遷移
  def after_sign_in_path_for(resource)
    about_path
  end

 # サインアウト後aboutページ遷移
 def after_sign_out_path_for(resource)
  about_path
end

  protected
  
  # ストロングパラメータと同様の機能
  # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
