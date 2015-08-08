After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.

  ::Middleman::YaLoremJa::Extension::YaLoremJaObj.reset_instance
end
