class ApplicationController < ActionController::Base
  include ControllerAuthentication
  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to welcome_url, :alert => exception.message
    else
      redirect_to login_url, :alert => exception.message
    end
  end
  protect_from_forgery

  before_filter :get_tweet
  before_filter :set_language
  before_filter :prepare_for_iphone
  
  helper_method :current_user, :english?, :ft, :iphone?, :god?

  def added(s); success(:added,s) end
  def alert(act); t("alert.#{act}") end
  def alert2(act,obj); t("alert.#{act}",:obj=>obj) end
  def created(s); success(:created,s) end
  def deleted(s); success(:deleted,s) end
  def d(s); t(s).downcase end
  def dp(s); pl(s).downcase end
  def english?; session[:language] == 'en' end
  def ft(s); t("formtastic.labels.#{s.to_s}") end
  def ftd(s); d("formtastic.labels.#{s.to_s}") end
  def god?; current_user && current_user.role?(:god) end
  def notify(act); t("notice.#{act}") end
  def pl(s); t(s).match(/\w/) ? t(s).pluralize : t(s) end  
  def success(act,mdl); t("success.#{act}",:obj=>d(mdl)) end
  def success_p(act,mdl); t("success.#{act}",:obj=>dp(mdl)) end
  def success_p(act,owner,mdl); t("success.#{act}",:obj=>t(:possessive,:owner=>owner,:obj=>dp(mdl))) end
  def updated(s); success(:updated,s) end
  def updated_p(s); success_p(:updated,s) end
  def updated_p(s1,s2); success_p(:updated,s1,s2) end

  def toggle_language
    session[:language] = (session[:language] == 'ja' ? 'en' : 'ja')
    redirect_to :back
  end
  
  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def current_user_name; current_user && current_user.name end
    def current_user_email; current_user && current_user.email end
    def current_user_affiliation; current_user && current_user.affiliation end

    def get_tweet
      @tweet = Tweet.last
    end

    def iphone?
      if session[:iphone]
        session[:iphone] == "1"
      else
        #request.user_agent =~ /Mobile|webOS/
      end
    end

    def prepare_for_iphone
      session[:iphone] = params[:iphone] if params[:iphone]
      request.format = :iphone if iphone?
    end
    
    def set_language
      I18n.locale = session[:language] || I18n.default_locale
    end
end
