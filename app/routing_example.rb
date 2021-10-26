require 'active_record'

class RoutingExample
  def call(env)
    [200, {"Content-Type" => "text/html"}, File.open(File.dirname(__FILE__) + '/../public/index.html')]
  end
end
