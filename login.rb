# login
# got to add encryption

def login (db, username, password)
     results = db.get_first_value('SELECT Password FROM log_in WHERE TwitterUsername = ?', [username])
     if(results == password)
         return true
     else
         return false
     end
    
end

def update_details(db, username, email, password, contact_number, post_code, address)
    
     # perform validation
    username_ok = !username.nil? && username !=""

    all_ok = username_ok
    user_level = 2

    # add data to the database
    if all_ok

        db.execute(
            'UPDATE personal_details SET Email = ?, ContactNumber =  ?, Address =  ? WHERE TwitterUsername = ?',
            [email , contact_number, address,username])
        
         db.execute(
            'UPDATE log_in SET Password = ? WHERE TwitterUsername = ?',
            [password, username])
        return true
    else
        return false
    end
end


    