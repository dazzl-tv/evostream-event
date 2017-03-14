# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Events::InStreamClosed, type: :request do
  let(:name_stream) do
    "#{Evostream::Service.name}#{Faker::Number.between(1, 999)}"
  end

  let(:body) do
    {
      id: Faker::Number.between(1, 999_999),
      payload: {
        PID: Faker::Number.between(1, 999_999),
        appName: 'evostreamms',
        audio: {
          bytesCount: Faker::Number.between(1, 999_999),
          codec: 'AAAC',
          codecNumeric: Faker::Number.between(1, 999_999),
          droppedBytesCount: 0,
          droppedPacketsCount: 0,
          packetsCount: Faker::Number.between(1, 999_999)
        },
        bandwidth: Faker::Number.between(1, 999_999),
        connectionType: 0,
        creationTimestamp: Faker::Number.decimal(2),
        customData: nil,
        farIp: Faker::Internet.ip_v4_address,
        farPort: Faker::Number.between(1, 65_536),
        ip: Faker::Internet.ip_v4_address,
        name: name_stream,
        nearIp: Faker::Internet.ip_v4_address,
        nearPort: Faker::Number.between(1, 65_536),
        outStreamsUniqueIds: [
          4,
          5
        ],
        port: Faker::Number.between(1, 65_536),
        processId: Faker::Number.between(1, 999),
        processType: 'origin',
        queryTimestamp: Faker::Number.decimal(3),
        type: 'INP',
        typeNumeric: Faker::Number.between(1, 999_999_999),
        uniqueId: 2,
        upTime: Faker::Number.decimal(3),
        userAgent: 'Lavf56.40.101',
        video: {
          bytesCount: Faker::Number.between(1, 999_999),
          codec: 'VH264',
          codecNumeric: Faker::Number.between(1, 999_999_999),
          droppedBytesCount: 0,
          droppedPacketsCount: 0,
          height: Faker::Number.between(1, 999),
          level: Faker::Number.between(1, 999),
          packetsCount: Faker::Number.between(1, 999),
          profile: Faker::Number.between(1, 999),
          width: Faker::Number.between(1, 999)
        }
      },
      processId: Faker::Number.between(1, 999_999),
      timestamp: Faker::Number.between(1, 999_999),
      type: 'inStreamClosed'
    }
  end

  let(:type_default) { 'inStreamClosed' }

  context 'payload is correct' do
    let(:type) { body[:type] }
    let(:payload) { body[:payload] }

    include_examples 'payload is correct'
  end

  context 'payload isn\'t correct' do
    let(:body) { Faker::Lorem.paragraph }
    let(:type) { Faker::Zelda.character }
    let(:payload) { Faker::Zelda.game }

    include_examples 'payload isn\'t correct'
  end
end
