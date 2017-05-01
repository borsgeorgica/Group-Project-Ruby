# order methods
# add order to the database
# update order 

require_relative 'order.rb'


def add_order(db,username, pizza, date)
    
    status = "unconfirmed"
    no_of_rows = db.get_first_value(
        'SELECT COUNT(*) FROM orders')
    
    order_id = no_of_rows.to_i + 1
    db.execute(
        'INSERT INTO orders VALUES (?, ?, ?, ?, ?)',
        [order_id, username, pizza, status, date])
    
end

def add_feedback_tweet(db, username, message, date)
    db.execute(
        'INSERT INTO feedback VALUES (?, ?, ?)',
        [date, username, message])
end

def add_competition_tweet(db, username,tweet, date)
    db.execute(
        'INSERT INTO competition VALUES (?, ?, ?)',
        [date, username, tweet])
end


def get_no_of_orders(db)
    no_of_rows = db.get_first_value(
        'SELECT COUNT(*) FROM orders')
    return no_of_rows.to_i
    
end

def get_no_of_feedback(db)
    no_of_rows = db.get_first_value(
        'SELECT COUNT(*) FROM feedback')
    return no_of_rows.to_i
    
end

def update_order_confirm(db, username, confirmation_date)
    status = "confirmed"
    if(get_no_of_orders(db)!=0)
        order_date = db.get_first_value('SELECT Date FROM orders WHERE TwitterUsername = ?', [username])
        order_date = DateTime.parse(order_date.to_s)
        confirmation_date = DateTime.parse(confirmation_date)
        if(confirmation_date > order_date)
            db.execute(
                'UPDATE orders SET Status = ? WHERE TwitterUsername = ?',
                [status, username])
        end
    end

end

def update_order(db,date,status)
    db.execute(
        'UPDATE orders SET Status = ? WHERE Date = ?',
        [status, date])
       
end

def update_order_accept(db, date)
    status = "accepted"
    id = 1
    id = id.to_i
    db.execute(
        'UPDATE orders SET Status = ? WHERE Date = ?',
        [status, date])
end

def delete_order(db, id)
   
    id = id.to_i
    db.execute(
        'DELETE FROM orders WHERE OrderID = ?', 
        [id])
end

def update_order_id(db)
    no_of_orders = get_no_of_orders(db)
    for i in 1..no_of_orders
        db.execute(
        'UPDATE orders SET OrderID = ? WHERE OrderID = ?',
        [i, i+1])
    end
            
end

def get_processing_orders(db)
    no_of_orders = get_no_of_orders(db)

    orders = Array.new
    
    for i in 0...no_of_orders
        id = i + 1
        username = db.get_first_value('SELECT TwitterUsername FROM orders WHERE OrderID = ?', [id])
        pizza = db.get_first_value('SELECT Pizza FROM orders WHERE OrderID = ?', [id])
        status = db.get_first_value('SELECT Status FROM orders WHERE OrderID = ?', [id])
        date = db.get_first_value('SELECT Date FROM orders WHERE OrderID = ?', [id])
        order = Order.new(id,username, pizza, status, date)
        orders.push(order)
        
    end
    
    return orders
        
end

def get_feedback_tweets(db)
    
    no_of_feedback = get_no_of_feedback(db)

    feedback = Array.new
    
    feedback = db.execute('SELECT * FROM feedback')
    
    return feedback
    
    
end

def get_competition_tweets(db)

    return db.execute('SELECT * FROM competition')
   
end

def get_accepted_orders(db)
    status_unconfirmed = 'unconfirmed'
    status_confirmed = 'confirmed'
    return db.execute('SELECT Date, TwitterUsername, Pizza, Status FROM orders WHERE NOT Status = ? OR Status = ?', 
        [status_confirmed], [status_unconfirmed])
end

def delete_accepted_orders(db)
    status = "accepted"
    db.execute(
        'DELETE FROM orders WHERE Status = ?', 
        [status])
end

def get_orders_by_user(db, username)
    orders = db.execute('SELECT * FROM orders WHERE TwitterUsername = ?',
        [username])  
    puts "order is:"
    puts orders
    puts username
    return  orders
end

def get_pizza_type(pizza)
    if pizza.downcase.include? "milano"
            type = "Milano"
    elsif pizza.downcase.include? "ardente"
            type = "Ardente"
    elsif pizza.downcase.include? ""
            type = ""    
    elsif pizza.downcase.include? ""
            type = ""
    elsif pizza.downcase.include? ""
            type = "" 
        
    end
    
    return type  
end

def get_pizza_size(pizza)
    if pizza.downcase.include? "large"
            size = "Large"
    elsif pizza.downcase.include? "medium"
            size = "Medium"
    elsif pizza.downcase.include? "small"
            size = "Small"
    end
    
    return size   
end

