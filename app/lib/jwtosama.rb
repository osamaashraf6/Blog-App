class JsonWebToken
  def self.decode(token)
    JWT.decode(token, 'OSAMA')[0]
  end
end
