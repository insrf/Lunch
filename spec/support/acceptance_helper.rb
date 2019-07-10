module AcceptanceHelper
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  def sign_out
    visit '/'
    click_on 'log_out'
  end

  def create_menu(admin, item)
    sign_in(admin)
    visit admin_menus_path

    click_on 'New'

    check item.name
    click_on 'Create Menu'
  end

  def go_order(user)
    sign_in(user)
    visit root_path

    click_on 'Go order'
  end
end
