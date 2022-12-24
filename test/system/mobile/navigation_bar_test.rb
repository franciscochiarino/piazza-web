require "application_system_test_case"

module Mobile
  class NaviagionBarTest < MobileSystemTestCase
    test "can access sign up page via burger menu" do
      visit(root_path)

      find(".navbar-burger").click
      click_on(I18n.t("shared.navbar.sign_up"))

      assert_current_path(sign_up_path)
    end

    test "can access login page via burger menu" do
      visit(root_path)

      find(".navbar-burger").click
      click_on(I18n.t("shared.navbar.login"))

      assert_current_path(login_path)
    end

    test "can log out via burger menu" do
      log_in(users(:kramer))

      find(".navbar-burger").click
      click_on((I18n.t("shared.navbar.logout")))

      assert_selector(".notification.is-success", text: I18n.t("sessions.destroy.success"))
    end
  end
end
