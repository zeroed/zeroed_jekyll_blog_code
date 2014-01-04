require 'digest/md5'
module Jekyll
  module GravatarFilter
    def to_gravatar(email)
      "https://www.gravatar.com/avatar/#{hash(email)}"
    end

    private :hash

    def hash(email)
      email_address = email ? email.downcase.strip : ''
      Digest::MD5.hexdigest(email_address)
    end
  end
end

Liquid::Template.register_filter(Jekyll::GravatarFilter)
