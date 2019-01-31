def github_mock
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
    {
      provider: 'github',
      uid: '12345',
      info: {
        name: 'mockuser',
        email: '12345@sample.com'
      },
      credentials: {
        token: 'hogefuga'
      }
    }
  )
end
