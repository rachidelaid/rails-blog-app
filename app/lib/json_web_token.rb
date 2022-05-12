class JsonWebToken
  def self.decode(token)
    decoded = JWT.decode(token, "BIG_SECRET")[0]
  end
end