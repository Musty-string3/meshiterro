class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行されます。

  def after_sign_in_path_for(resource)
    post_images_path
  end
  # after_sign_in_path_forはDeviseが用意しているメソッドでサインイン後にどこに遷移するかを設定しているメソッドです。

  def after_sign_out_path_for(resource)
    about_path
  end
  # サインアウト後の遷移先をAboutページに設定

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  #   configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことでユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可しています。
end
