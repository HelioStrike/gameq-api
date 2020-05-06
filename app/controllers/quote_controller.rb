class QuoteController < ApplicationController

    def new
        quote = Waitingquote.create(game: params[:game], character: params[:character],
            quote: params[:quote], pos: 0, neg: 0)
        if quote.valid?
            quote.save
        else
            render :nothing => true, :status => :bad_request
        end
    end

    def validate
        id = params[:id]
        vote = params[:vote]
        quote = Waitingquote.find(id)
        if quote.nil? || (vote != 1 && vote != -1)
            return render :nothing => true, :status => :bad_request
        end
        
        if quote.neg == 1 && vote == -1
            Waitingquote.destroy(id)
        elsif quote.pos == 3 && vote == 1
            game = Game.where(name: quote.game).first
            if game.nil?
                game = Game.create(name: quote.game)
                if game.valid?
                    game.save
                else
                    return render :nothing => true, :status => :bad_request
                end
            end

            character = Character.where(game_id: game.id, name: quote.character).first
            if character.nil?
                character = Character.create(game_id: game.id, name: quote.character)
                if character.valid?
                    character.save
                else
                    return render :nothing => true, :status => :bad_request
                end
            end

            quote = Quote.create(game_id: game.id, character_id: character.id, text: quote.quote)
            quote.save
            Waitingquote.destroy(id)
        else
            if vote == 1
                quote.increment!(:pos)
            else
                quote.increment!(:neg)
            end
        end
    end
end
