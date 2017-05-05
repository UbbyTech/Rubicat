require 'octokit'
require 'netrc'

class Base
  # attr_accessor :un, :pw

  # un = username
  # pw = password

  def initialize
    @client = Octokit::Client.new(:access_token =>
    '0fbd1b3377212d79931c0c294300c2a48584d08f')

    print "Username you want to search?\t"
    @username = gets.chomp.to_s

    @user = @client.user(@username)

    puts "#{@username} email is:\t\t#{@user.email}"
  end
end



start = Base.new
