require 'rails_helper'

RSpec.describe "GitUser", type: :request do
  describe 'gitUser' do
    it 'returns user data including name and repositories' do
      query = <<~GQL
        query {
          gitUser(gitLogin: "Aztec0") {
            name
            repos
          }
        }
      GQL

      result = GraphqlSchema.execute(query)
      expect(result.dig("data", "gitUser", "name" )).present?
      expect(result.dig("data", "gitUser", "repos" )).present?
      end
  end
end
