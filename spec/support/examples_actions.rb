# frozen_string_literal: true

RSpec.shared_examples 'test request action' do
  let(:request) { action.execute_action(action_name) }

  it { expect(request).to be_an_instance_of(Net::HTTPOK) }
end
