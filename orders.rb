# order methods
# add order to the database
# update order 

def add_order(db,username, pizza, date)
    
    status = "unconfirmed"
    no_of_rows = db.get_first_value(
        'SELECT COUNT(*) FROM orders')
    
    order_id = no_of_rows.to_i + 1
    db.execute(
        'INSERT INTO orders VALUES (?, ?, ?, ?, ?)',
        [order_id, username, pizza, status, date])
    
end

def update_order_confirm(db, username, confirmation_date)
    status = "confirmed"
    order_date = db.get_first_value('SELECT Date FROM orders WHERE TwitterUsername = ?', [username])
    order_date = DateTime.parse(order_date.to_s)
    confirmation_date = DateTime.parse(confirmation_date)
    if(confirmation_date > order_date)
        db.execute(
        'UPDATE orders SET Status = ? WHERE TwitterUsername = ?',
        [status, username])
    end
    
 
end

def update_order_accept(db, id)
    ###
    #
end

def delete_order(db, id)
    ###
    #
    db.execute(
        'DELETE FROM orders WHERE OrderID = ?', 
        [id])
end

def get_processing_orders(db)
    ##
    #
    #
end