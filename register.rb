# Register
#

def register_user (db, username, name, surname, email, password, contact_number,storelocation, address)
    # perform some sort of validation
    username_ok = !username.nil? && username !=""
    count = db.get_first_value(
        'SELECT COUNT(*) FROM personal_details WHERE email = ?',
        [email])
    unique = (count == 0)
    all_ok = username_ok && unique
    user_level = 2
    
    # add data to the database
    if all_ok

        db.execute(
            'INSERT INTO personal_details VALUES (?, ?, ?, ?, ?, ?, ?)',
            [username, name, surname, email , contact_number,storelocation, address])

         db.execute(
            'INSERT INTO log_in VALUES (?, ?, ?, ?)',
            [username,  password, user_level, 0])
        return true
    else
        return false
    end
        
    
       
end
    