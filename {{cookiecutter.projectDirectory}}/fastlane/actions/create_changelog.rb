module Fastlane
  module Actions
    module SharedValues
      CREATE_CHANGELOG_CUSTOM_VALUE = :CREATE_CHANGELOG_CUSTOM_VALUE
    end

    class CreateChangelogAction < Action
      def self.run(params)

        UI.user_error!("You need to have the git-chglog cli installed! Aborted \u{1F6D1}") unless system("which git-chglog")

        # fastlane will take care of reading in the parameter and fetching the environment variable:
        UI.message "Parameter Tag Pattern: #{params[:tag_pattern]}"
        UI.message "Parameter Next Tag Value: #{params[:next_tag]}"

        sh "git-chglog -o CHANGELOG.md --tag-filter-pattern #{params[:tag_pattern]} --next-tag #{params[:next_tag]}"

        # Actions.lane_context[SharedValues::CREATE_CHANGELOG_CUSTOM_VALUE] = "my_val"
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Generate a changelog from your commit messages and tags"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "This action will use `git-chglog` to create an automatic changelog from your commit messages. \n
        You can specify the tag pattern that should be used for grouping the commits. \n
        This will only work if you are conforming to the `Conventional Commit Specification`."
      end

      def self.available_options
        # Define all options your action supports. 
        
        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :tag_pattern,
                                       env_name: "FL_CREATE_CHANGELOG_TAG_PATTERN", # The name of the environment variable
                                       description: "Tag pattern to be used for grouping", # a short description of this parameter
                                       is_string: true, # true: verifies the input is a string, false: every kind of value
                                       verify_block: proc do |value|
                                          UI.user_error!("No tag pattern for CreateChangelogAction given, pass using `tag_pattern: 'pattern'`") unless (value and not value.empty?)
                                          # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                       end),
          FastlaneCore::ConfigItem.new(key: :next_tag,
                                       env_name: "FL_CREATE_CHANGELOG_NEXT_TAG",
                                       description: "Next Tag is used to create a new release in the changelog without having a tag in git",
                                       is_string: true, # true: verifies the input is a string, false: every kind of value
                                       verify_block: proc do |value|
                                        UI.user_error!("No next tag for CreateChangelogAction given, pass using `next_tag: 'newtag'`") unless (value and not value.empty?)
                                        # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                        end) 
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['CREATE_CHANGELOG_CUSTOM_VALUE', 'A description of what this value contains']
        ]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.authors
        ["alexanderwe"]
      end

      def self.is_supported?(platform)
        # you can do things like
        # 
        #  true
        # 
        #  platform == :ios
        # 
        #  [:ios, :mac].include?(platform)
        # 

        platform == :ios
      end
    end
  end
end
