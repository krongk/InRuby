require 'test_helper'

class EmailerTest < ActionMailer::TestCase
  test "index" do
    @expected.subject = 'Emailer#index'
    @expected.body    = read_fixture('index')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Emailer.create_index(@expected.date).encoded
  end

  test "send" do
    @expected.subject = 'Emailer#send'
    @expected.body    = read_fixture('send')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Emailer.create_send(@expected.date).encoded
  end

end
