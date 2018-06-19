class HomeController < ApplicationController
  def index
    @desarrollo_cuotas = []
    params[:amount].to_i.times do |time|
      line = {}
      line["mes"] = (time.to_i + 1)
      line["saldo"] = (time.to_i + 1)
      line["amortizacion"] = (time.to_i + 1)
      @desarrollo_cuotas.push(line)
    end
    puts @desarrollo_cuotas
  end
end
