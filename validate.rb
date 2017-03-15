# validation methods

def check_user_exists (db, user)
    user = user.strip
    count = db.get_first_value(
        'SELECT COUNT(*) FROM personal_details WHERE TwitterUsername = ?',
        [user])
    return (count!=0)
end