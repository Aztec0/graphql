class GitUsersController < ApplicationController
  def index
  end

  def show
    @gitLogin = params[:gitLogin]

    @user_data = GraphqlSchema.execute(
      query_string,
      variables: { gitLogin: @gitLogin }
    )
  end

  private

  def query_string
      <<-GRAPHQL
      query ($gitLogin: String!) {
        gitUser(gitLogin: $gitLogin) {
          name
          repos
        }
      }
    GRAPHQL
  end
end
