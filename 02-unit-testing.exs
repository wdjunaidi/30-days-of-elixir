# http://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html
# http://elixir-lang.org/docs/stable/ex_unit/ExUnit.html

# set up the test runner
ExUnit.start()

defmodule MyTest do
  # use requires a module and sets up macros; will explore more later
  use ExUnit.Case

  test 'simple test' do
    assert 1 + 1 == 2

    # assert 1 + 1 == 3                     # Elixir is smart! No need for assert_equal, assert_gte, etc.
                                            # And we still get great failure messages, yipee!
                                            # 1) test_assert (MyTest)
                                            #    ** (ExUnit.ExpectationError)
                                            #                 expected: 2
                                            #      to be equal to (==): 3
  end

  # test macro accepts string as test name
  test "refute is opposite of assert" do
    refute 1 + 1 == 3
  end

  # test macro also accepts an atom
  test :assert_raise do
    assert_raise ArithmeticError, fn ->
      1 + "x"
    end
  end

  test "assert_in_delta asserts that val1 and val2 differ by less than delta." do
    assert_in_delta 1, # actual
                    5, # expected
                    6  # delta
  end
end
