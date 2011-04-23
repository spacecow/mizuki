class OperatorController < ApplicationController
  def welcome
    prev = Maintenance.where(:ip => request.remote_ip)
    m = Maintenance.new(:ip => request.remote_ip)
    m.place = prev.first.place unless prev.empty?
    m.save
  end

end
