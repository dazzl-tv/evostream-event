# frozen_string_literal: true

RSpec.shared_examples 'argument exit' do
  it { expect { runner.run }.to terminate.with_code(code) }
end

RSpec.shared_examples 'argument output' do
  it { expect { runner.run }.to output(out).to_stdout }
end
