require 'test_helper'

class StockfeedWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:stockfeed)
  end
  
  test "display" do
    render_widget :stockfeed
    assert_select "h1"
  end
end
