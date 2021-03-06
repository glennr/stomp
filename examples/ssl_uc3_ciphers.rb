# -*- encoding: utf-8 -*-

#
# Reference: https://github.com/stompgem/stomp/wiki/extended-ssl-overview
#
require "rubygems"
require "stomp"
#
# == SSL Use Case 3 - User Supplied Ciphers
#
# If you need your own ciphers list, this is how.
# Stomp's default list will work in many cases.  If you need to use this, you
# will know it because SSL connect will fail.  In that case, determining
# _what_ should be in the list is your responsibility.
#
class ExampleSSL3C
  # Initialize.
  def initialize
  end
  # Run example.
  def run
    ciphers_list = [["DHE-RSA-AES256-SHA", "TLSv1/SSLv3", 256, 256], ["DHE-DSS-AES256-SHA", "TLSv1/SSLv3", 256, 256], ["AES256-SHA", "TLSv1/SSLv3", 256, 256], ["EDH-RSA-DES-CBC3-SHA", "TLSv1/SSLv3", 168, 168], ["EDH-DSS-DES-CBC3-SHA", "TLSv1/SSLv3", 168, 168], ["DES-CBC3-SHA", "TLSv1/SSLv3", 168, 168], ["DHE-RSA-AES128-SHA", "TLSv1/SSLv3", 128, 128], ["DHE-DSS-AES128-SHA", "TLSv1/SSLv3", 128, 128], ["AES128-SHA", "TLSv1/SSLv3", 128, 128], ["RC4-SHA", "TLSv1/SSLv3", 128, 128], ["RC4-MD5", "TLSv1/SSLv3", 128, 128], ["EDH-RSA-DES-CBC-SHA", "TLSv1/SSLv3", 56, 56], ["EDH-DSS-DES-CBC-SHA", "TLSv1/SSLv3", 56, 56],
    ["DES-CBC-SHA", "TLSv1/SSLv3", 56, 56], ["EXP-EDH-RSA-DES-CBC-SHA", "TLSv1/SSLv3", 40, 56], ["EXP-EDH-DSS-DES-CBC-SHA", "TLSv1/SSLv3", 40, 56], ["EXP-DES-CBC-SHA", "TLSv1/SSLv3", 40, 56], ["EXP-RC2-CBC-MD5", "TLSv1/SSLv3", 40, 128], ["EXP-RC4-MD5", "TLSv1/SSLv3", 40, 128]]
    #
    # SSL Use Case 3
    #
    ssl_opts = Stomp::SSLParams.new(:key_file => "/home/gmallard/sslwork/twocas_tj/clientCA/ClientTJ.key",
    :cert_file => "/home/gmallard/sslwork/twocas_tj/clientCA/ClientTJ.crt", :ciphers => ciphers_list)

    #
    hash = { :hosts => [
        {:login => 'guest', :passcode => 'guest', :host => 'localhost', :port => 61612, :ssl => ssl_opts},
      ]
    }
    #
    puts "Connect starts, SSL Use Case 3"
    c = Stomp::Connection.new(hash)
    puts "Connect completed"
    puts "SSL Verify Result: #{ssl_opts.verify_result}"
    # puts "SSL Peer Certificate:\n#{ssl_opts.peer_cert}"
    c.disconnect
  end
end
#
e = ExampleSSL3C.new
e.run

