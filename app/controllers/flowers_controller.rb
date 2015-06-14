class FlowersController < ApplicationController
    def find 
        
    end
    
    def aquatic
        
    end 
    
    def props
        flowers = Flower.where("colour='"+params[:colour].to_s+"' OR colour2='"+params[:colour].to_s+"' OR colour3='"+params[:colour].to_s+"'")
        @categories = flowers.pluck(:prop1)
        @categories << flowers.pluck(:prop2)
        @categories << flowers.pluck(:prop3)
        @categories = @categories.flatten.uniq
        @categories.reject! { |c| c.blank? || c == "aquatic" }
        
    end
    
    def show
        petals = 0
        params[:petals].blank? ? petals = 0 : petals = params[:petals]
        @flowers = Flower.where("colour='"+params[:colour].to_s+"' OR colour2='"+params[:colour].to_s+"' OR colour3='"+params[:colour].to_s+"'").where("petals='"+petals.to_s+"'").where("prop1='"+params[:prop].to_s+"' OR prop2='"+params[:prop].to_s+"' OR prop3='"+params[:prop].to_s+"'").pluck(:id)
        
        if @flowers.length > 1
            @third = (@flowers.length/3.0).ceil
            @tthird = @third*2
            @message = "There are "+@flowers.length.to_s+" flowers that match your description!"
        elsif @flowers.length == 1
            @third = 1
            @tthird = 1
            @message = "There is one flower that matches your description!"
        else
            @flowers = []
            @third = 0
            @tthird = 0
            @message = "Sorry, no matches were found in our database. Try adjusting your description. If you still can't find your flower, submit a request with a picture of your flower <a href='contact'>here</a>"
        end
        
            
        
    end
end
