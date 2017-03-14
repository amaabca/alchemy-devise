module Alchemy
  mattr_accessor :mount_devise_routes, :devise_modules
  @@mount_devise_routes = true
  @@devise_modules = [
    :database_authenticatable,
    :trackable,
    :validatable,
    :timeoutable,
    :recoverable
  ]
end

require 'alchemy/devise/ability'

Alchemy.register_ability(Alchemy::Devise::Ability)

Alchemy::Modules.register_module({
  name: 'users',
  engine_name: 'alchemy',
  position: 4.1,
  navigation: {
    name: 'modules.users',
    controller: 'alchemy/admin/users',
    action: 'index',
    icon: 'users'
  }
})

Alchemy.user_class_name = 'Alchemy::User'
Alchemy.signup_path     = '/admin/signup'
Alchemy.login_path      = '/admin/login'
Alchemy.logout_path     = '/admin/logout'
