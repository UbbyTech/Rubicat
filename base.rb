require 'octokit'

class Base
  attr_accessor :un, :pw

  # un = username
  # pw = password

  def initialize
    @client = Octokit::Client.new(:access_token => '0fbd1b3377212d79931c0c294300c2a48584d08f')

    @user = @client.user
    @user.login

    puts @user[:company]
    puts @user[:name]
    puts @user[:email]

=begin
    @user.length do |organization|
      puts organization[:name]
    end
=end

  end

  def rubyDevs(un)
    print "Looking for a ruby dev? "

    answer = gets.chomp.to_s
    if (answer == "n" or answer == "N" || answer == "no")
      # system.exit
    elsif
      # Octokit::Client.user '#{un}'
      puts 'error error'
    end
  end

  def jsDevs(un)

  end

  def pyDevs(un)

  end

  def caps!
    @un.capitlize!
  end
end



kiratsuchi = Base.new
