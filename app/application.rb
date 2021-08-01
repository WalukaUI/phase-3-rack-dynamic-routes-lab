class Application
    # @@items = [Item.new("cake",3.50), Item.new("butter",5.50),Item.new("bun",1.50)]
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)
            itemname=req.path.split("/items/").last
            if item= @@items.find {|item| item.name == itemname}
                resp.write "#{item.price}"
            else
                resp.status= 400
                resp.write "Item not found"
            end
        else
            resp.status= 404
            resp.write "Route not found"
        end
        resp.finish
    end


end