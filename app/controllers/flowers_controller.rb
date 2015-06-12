class FlowersController < ApplicationController
    def find 
        flowers = Flower.where(colour: params[:colour])
    end
    
    def show
        
    end
end
