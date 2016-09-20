require 'rfg_api_test'

class SocialApiTest < RFGAPITest

  def expected_dir_path
    # eg. "test_some_stuff"
    method = (caller[0] =~ /`([^']*)'/ and $1)
    # eg. "some_test"
    file = (caller[0] =~ /([^\/:]*).rb:/ and $1)
    # eg. expected_files/some_test/test_some_stuff
    dir = 'expected_files/social/' + file + '/' + method
  end

end
