module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/index'
    when /the login\s?page/
      '/login'
    when /the register\s?page/
      '/register'
    when /the panel\s?page/
      '/client/panel'
    when /the logout\s?page/
      '/logout'
    when /the settings\s?page/
      '/client/settings'
    when /the order\s?page/
      '/admin/order'
    when /the admin\s?page/
      '/admin/index'
    when /the accepted\s?page/
      '/admin/accepted'
    when /the users\s?page/
      '/admin/users'
    when /the editusers\s?page/
      '/admin/editusers'
    when /the twitter\s?page/
      '/admin/twitter'
   

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"

    end
  end
end

World(NavigationHelpers)
