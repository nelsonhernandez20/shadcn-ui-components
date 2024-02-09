# lib/generators/shadcn-ui-components-generator.rb
module ShadcnUiComponent
  class Generator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    argument :component_name, type: :string, required: true

    def create_component_files
      copy_file "#{component_name}_component.rb", "app/components/#{component_name}_component.rb"
      copy_file "#{component_name}_component.html.erb", "app/components/#{component_name}_component.html.erb"

      # Agrega los controladores Stimulus solo si es "alert_dialog_component"
      if component_name == "alert_dialog"
        copy_file "#{component_name}_controller.js", "app/javascript/controllers/#{component_name}_controller.js"
        copy_file "dismissable_controller.js", "app/javascript/controllers/dismissable_controller.js"
      end
    end
  end
end