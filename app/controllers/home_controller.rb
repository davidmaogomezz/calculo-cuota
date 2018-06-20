class HomeController < ApplicationController
  def index
    @quota_development = []
    @amount = params["amount"].to_f
    @term = params["term"].to_i
    @interest = params["interest"].to_f
    @amortization = @amount/@term
    @total = 0
      @term.times do |time|
      if @amount > 0
        line = {}
        line["month"] = (time + 1)
        if time > 0
          if @amount > @amortization
            @amount -= @amortization
          else
            @amount -= @amount
          end
        else
          
        end
        @interests = @amount * (@interest/100)      
        @quota_month = @amortization + @interests
        line["amount"] = @amount  
        line["balance_final"] = @amount         
        line["amortization"] = @amortization
        line["interests"] = @interests
        line["quota_month"] = @quota_month
        @total += @quota_month
      end
      @quota_development.push(line)
    end
    puts @quota_development
  end
end
