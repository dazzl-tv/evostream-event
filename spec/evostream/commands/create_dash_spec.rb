# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::CreateDASH do
  let(:command) { Evostream::Commands::CreateDASH }

  context 'manifest_name' do
    let(:arg_value) { Faker::Games::Pokemon.name }
    let(:argument) { 'manifest_name' }

    include_examples 'command raise'
  end

  context 'with mandatory argument(s)' do
    let(:cmd) do
      {
        local_stream_names: Faker::Games::Pokemon.name,
        target_folder: Faker::File.file_name(dir: '/path/to')
      }
    end

    include_examples 'command'
  end
end
