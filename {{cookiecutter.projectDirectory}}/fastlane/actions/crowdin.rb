module Fastlane
    module Actions
      module SharedValues
        CROWDIN_CUSTOM_VALUE = :CROWDIN_CUSTOM_VALUE
      end
  
      class CrowdinAction < Action
        def self.run(params)
          UI.user_error!("crowdin.yml is required to run this lane! Aborted \u{1F6D1}") unless File.exist?("#{params[:config_file]}")
          UI.user_error!("You need to have the crowdin cli installed! Aborted \u{1F6D1}") unless system("which crowdin")
  
          # fastlane will take care of reading in the parameter and fetching the environment variable:
          UI.message "Parameter crowdin CLI Action: #{params[:command]}"
          UI.message "Parameter crowdin CLI config file: #{params[:config_file]}"
  
          sh "crowdin #{params[:command]} --config #{params[:config_file]}"
  
          # Actions.lane_context[SharedValues::CROWDIN_CUSTOM_VALUE] = "my_val"
        end
  
        #####################################################
        # @!group Documentation
        #####################################################
  
        def self.description
          "This action is a wrapper around the crowdin cli"
        end
  
        def self.details
          # Optional:
          # this is your chance to provide a more detailed description of this action
          "This action should serve as a convenience wrapper around the crowdin cli to be used in CI/CD environments"
        end
  
        def self.available_options
          # Define all options your action supports. 
          
          [
            FastlaneCore::ConfigItem.new(key: :command,
                                         env_name: "FL_CROWDIN_COMMAND", # The name of the environment variable
                                         description: "Command for the crowdin cli", # a short description of this parameter
                                         verify_block: proc do |value|
                                            UI.user_error!("No CLI command provided, pass using `command: 'command'`") unless (value and not value.empty?)
                                            # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                         end),
            FastlaneCore::ConfigItem.new(key: :config_file,
                                         env_name: "FL_CROWDIN_CONFIG_FILE",
                                         description: "Path to the config file for crowdin",
                                         default_value: "crowdin.yml",
                                         verify_block: proc do |value|
                                          UI.user_error!("No crowdin config file provided, pass using `config_file: 'path'`") unless (value and not value.empty?)
                                          UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                       end)
          ]
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
  