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
        if params[:prop].blank? && params[:petals].present?
            @flowers = Flower.where("colour='"+params[:colour].to_s+"' OR colour2='"+params[:colour].to_s+"' OR colour3='"+params[:colour].to_s+"'").where(petals: params[:petals])
        elsif params[:search].present?
            @flowers = Flower.where("name like ?", "%#{params[:search]}%")
        elsif params[:petals].blank? && params[:prop].blank?
            @flowers = Flower.where("colour='"+params[:colour].to_s+"' OR colour2='"+params[:colour].to_s+"' OR colour3='"+params[:colour].to_s+"'")
        else
            @flowers = Flower.where("colour='"+params[:colour].to_s+"' OR colour2='"+params[:colour].to_s+"' OR colour3='"+params[:colour].to_s+"'").where("prop1='"+params[:prop].to_s+"' OR prop2='"+params[:prop].to_s+"' OR prop3='"+params[:prop].to_s+"'").pluck(:id)
        end
        
        if @flowers.length > 1
            @third = (@flowers.length/3.0).ceil
            @tthird = @third*2
            @message = "Found "+@flowers.length.to_s+" flowers that match your description!"
        elsif @flowers.length == 1
            @third = 1
            @tthird = 1
            @message = "Found one flower that matches your description!"
        else
            @flowers = []
            @third = 0
            @tthird = 0
            @message = "Sorry, no matches were found in our database. <br>Try adjusting your description or submit a request with a picture of your flower <a href='contact'>here</a>"
        end
            
        
    end
end
