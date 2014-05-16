require 'spec_helper'

describe Translation::Client::SyncOperation::UpdateAndCollectPotFileStep do

  it do
    pot_path     = 'tmp/test.pot'
    source_files = Dir['spec/support/**/*.{rb,erb}']

    step_operation = Translation::Client::SyncOperation::UpdateAndCollectPotFileStep.new(pot_path, source_files)
    params = {}
    step_operation.run(params)

    params['pot_data'].should end_with <<EOS
#: ../spec/support/rails_app/app/models/fake_model.rb:3
msgid "Hi kids, do you like violence ?"
msgstr ""

#: ../spec/support/rails_app/app/views/layouts/application.html.erb:1
msgid "Let's get ready to rumble!"
msgstr ""
EOS
  end

end