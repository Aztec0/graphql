# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :git_user, Types::GitUserType, null: true do
      argument :git_login, String, required: true
    end

    def git_user(git_login:)
      response_name = HTTParty.get("https://api.github.com/users/#{git_login}")
      response_repos = HTTParty.get("https://api.github.com/users/#{git_login}/repos")

    

      if response_repos.success?
        # Отримання масиву репозиторіїв з розкодованої відповіді JSON
        repos_array = JSON.parse(response_repos.body)
      
        # Отримання масиву назв репозиторіїв
        repo_names = repos_array.map { |repo| repo['name'] }
      
      else
        puts "Failed to retrieve repositories. Status code: #{response_repos.code}"
      end

      user_data = {name: response_name["name"], repos: repo_names}
    end
  end
end
