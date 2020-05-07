class QuoteController < ApplicationController

    def new
        quote = QuoteService.new.newWaitingquote(params[:game], params[:character], params[:quote])
        if !quote.valid?
            render :nothing => true, :status => :bad_request
        end
    end

    def validate
        validated = QuoteService.new.validateWaitingquote(params[:id], params[:vote])
        if !validated
            return render :nothing => true, :status => :bad_request
        end
    end
end
