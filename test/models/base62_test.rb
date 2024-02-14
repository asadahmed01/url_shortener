require "test_helper"

class Base62Test < ActiveSupport::TestCase
  test "encode 0" do
    assert_equal "0", Base62.encode(0)
  end

  test "encode 1" do
    assert_equal "1", Base62.encode(1)
  end

  test "encode 10" do
    assert_equal "a", Base62.encode(10)
  end

  test "encode 62" do
    assert_equal "10", Base62.encode(62)
  end

  test "decode 0" do
    assert_equal 0, Base62.decode("0")
  end

  test "decode 1" do
    assert_equal 1, Base62.decode("1")
  end

  test "decode 'a'" do
    assert_equal 10, Base62.decode("a")
  end

  test "decode '10'" do
    assert_equal 62, Base62.decode("10")
  end

end
