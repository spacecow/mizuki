class OperatorController < ApplicationController
  def welcome
    unless god?
      prev = Maintenance.where(:ip => request.remote_ip)
      m = Maintenance.new(:ip => request.remote_ip, :agent => request.user_agent)
      m.place = prev.first.place unless prev.empty?
      m.save
    end

    @events = Event.all.sort_by(&:when).reverse
  end

  def sao_tweet
    Tweet.save if god?
    redirect_to :back
  end
end
