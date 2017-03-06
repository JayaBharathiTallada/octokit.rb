module Octokit
  class Client

    # Methods for the Integrations API
    module Integrations

      # Find all installations that belong to an Integration
      #
      # @param options [Hash] An customizable set of options
      #
      # @see https://developer.github.com/v3/integrations/#find-installations
      #
      # @return [Array<Sawyer::Resource>] A list of installations
      def find_integration_installations(options = {})
        options = ensure_api_media_type(:integrations, options)
        paginate "/integration/installations", options
      end
      alias :find_installations :find_integration_installations

      # Create a new installation token
      #
      # @param installation [Integer] The id of a a GitHub Integration Installation
      # @param options [Hash] An customizable set of options
      #
      # @see https://developer.github.com/v3/integrations/#find-installations
      #
      # @return [<Sawyer::Resource>] An installation token
      def create_integration_installation_access_token(installation, options = {})
        options = ensure_api_media_type(:integrations, options)
        post "/installations/#{installation}/access_tokens", options
      end
      alias :create_installation_access_token :create_integration_installation_access_token

      # List repositories that are accessible to the authenticated installation
      #
      # @param options [Hash] An customizable set of options
      # @option options user_id [String] To filter results to repositories that are visible to
      #   both the installation and the given user.
      #
      # @see https://developer.github.com/v3/integrations/installations/#list-repositories
      #
      # @return [Array<Sawyer::Resource>] A list of repositories
      def list_integration_installation_repositories(options = {})
        options = ensure_api_media_type(:integrations, options)
        paginate "/installation/repositories", options
      end
      alias :list_installation_repos :list_integration_installation_repositories

      # Add a single repository to an installation
      #
      # @param installation [Integer] The id of a a GitHub Integration Installation
      # @param repo [Integer] The id of the GitHub repository
      # @param options [Hash] An customizable set of options
      #
      # @see https://developer.github.com/v3/integrations/installations/#add-repository-to-installation
      #
      # @return [Boolean] Success
      def add_repository_to_integration_installation(installation, repo, options = {})
        options = ensure_api_media_type(:integrations, options)
        boolean_from_response :put, "/installations/#{installation}/repositories/#{repo}", options
      end
      alias :add_repo_to_installation :add_repository_to_integration_installation

      # Remove a single repository to an installation
      #
      # @param installation [Integer] The id of a a GitHub Integration Installation
      # @param repo [Integer] The id of the GitHub repository
      # @param options [Hash] An customizable set of options
      #
      # @see https://developer.github.com/v3/integrations/installations/#remove-repository-from-installation
      #
      # @return [Boolean] Success
      def remove_repository_from_integration_installation(installation, repo, options = {})
        options = ensure_api_media_type(:integrations, options)
        boolean_from_response :delete, "/installations/#{installation}/repositories/#{repo}", options
      end
      alias :remove_repo_from_installation :remove_repository_from_integration_installation
    end
  end
end
