# frozen_string_literal: true

module Types
  class GitUserType < Types::BaseObject
    field :name, String, null: true
    field :repos, [String], null: true
  end
end
