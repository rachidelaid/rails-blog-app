class JsonWebToken
  def self.decode(token)
    JWT.decode(token, 'BIG_SECRET')[0]
  end
end
