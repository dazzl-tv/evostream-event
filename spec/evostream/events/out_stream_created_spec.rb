# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Events::OutStreamCreated do
  let(:type_default) { 'outStreamCreated' }

  context 'with HLS Flux' do
    let(:body) do
      {
        id: Faker::Number.between(from: 1, to: 999_999),
        payload: {
          PID: Faker::Number.between(from: 1, to: 999_999),
          appName: 'evostreamms',
          audio: {
            bytesCount: Faker::Number.between(from: 1, to: 999_999),
            codec: 'AAAC',
            codecNumeric: Faker::Number.between(from: 1, to: 999_999),
            droppedBytesCount: 0,
            droppedPacketsCount: 0,
            packetsCount: Faker::Number.between(from: 1, to: 999_999)
          },
          bandwidth: Faker::Number.between(from: 1, to: 999_999),
          connectionType: 0,
          creationTimestamp: Faker::Number.decimal(l_digits: 2),
          customData: nil,
          farIp: Faker::Internet.ip_v4_address,
          farPort: Faker::Number.between(from: 1, to: 65_536),
          hlsSettings: {
            AESKeyCount: Faker::Number.between(from: 1, to: 99),
            audioOnly: false,
            bandwidth: 0,
            chunkBaseName: 'segment',
            chunkLength: 1,
            chunkOnIDR: true,
            cleanupDestination: false,
            cleanupOnClose: true,
            configId: 1,
            createMasterPlaylist: true,
            drmType: 'none',
            fileLength: 0,
            groupName: Faker::Lorem.word,
            groupTargetFolder: Faker::File.file_name(dir: Faker::Lorem.word),
            hlsResume: false,
            hlsVersion: 3,
            keepAlive: true,
            localStreamName: Faker::TvShows::GameOfThrones.house,
            masterPlaylistPath: Faker::File.file_name(dir: Faker::Lorem.word, name: Faker::TvShows::GameOfThrones.city, ext: Faker::Color.color_name),
            maxChunkLength: 0,
            offsetTime: 0,
            operationType: 3,
            overwriteDestination: true,
            playlistLength: 5,
            playlistName: "#{Faker::Lorem.word}.#{Faker::Lorem.word}",
            playlistType: %w[rolling appending].sample,
            staleRetentionCount: 5,
            startOffset: 0,
            targetFolder: Faker::File.file_name(dir: Faker::Lorem.word, name: Faker::TvShows::GameOfThrones.city, ext: Faker::Color.color_name),
            timestamp: Faker::Number.decimal(l_digits: 1),
            useByteRange: false,
            useSystemTime: false
          },
          ip: Faker::Internet.ip_v4_address,
          name: "#{Faker::Games::Zelda.character}_#{Faker::Number.between(from: 1, to: 999)}",
          nearIp: Faker::Internet.ip_v4_address,
          nearPort: Faker::Number.between(from: 1, to: 65_536),
          outStreamsUniqueIds: nil,
          port: Faker::Number.between(from: 1, to: 65_536),
          processId: Faker::Number.between(from: 1, to: 999),
          processType: 'origin',
          queryTimestamp: Faker::Number.decimal(l_digits: 3),
          type: 'INP',
          typeNumeric: Faker::Number.between(from: 1, to: 999_999_999),
          uniqueId: 2,
          upTime: Faker::Number.decimal(l_digits: 3),
          userAgent: 'Lavf56.40.101',
          video: {
            bytesCount: Faker::Number.between(from: 1, to: 999_999),
            codec: 'VH264',
            codecNumeric: Faker::Number.between(from: 1, to: 999_999_999),
            droppedBytesCount: 0,
            droppedPacketsCount: 0,
            height: Faker::Number.between(from: 1, to: 999),
            level: Faker::Number.between(from: 1, to: 999),
            packetsCount: Faker::Number.between(from: 1, to: 999),
            profile: Faker::Number.between(from: 1, to: 999),
            width: Faker::Number.between(from: 1, to: 999)
          }
        },
        processId: Faker::Number.between(from: 1, to: 999_999),
        timestamp: Faker::Number.between(from: 1, to: 999_999),
        type: 'outStreamCreated'
      }
    end

    context 'when payload is correct' do
      let(:type) { body[:type] }
      let(:payload) { body[:payload] }
      let(:type_stream) { 'Hls' }

      include_examples 'payload is correct', false
    end

    context 'when payload isn\'t correct' do
      let(:body) { Faker::Lorem.paragraph }
      let(:type) { Faker::Games::Zelda.character }
      let(:payload) { Faker::Games::Zelda.game }

      include_examples 'payload isn\'t correct'
    end
  end

  context 'with DASH Flux' do
    let(:body) do
      {
        id: Faker::Number.between(from: 1, to: 999_999),
        payload: {
          PID: Faker::Number.between(from: 1, to: 999_999),
          appName: 'evostreamms',
          audio: {
            bytesCount: Faker::Number.between(from: 1, to: 999_999),
            codec: 'AAAC',
            codecNumeric: Faker::Number.between(from: 1, to: 999_999),
            droppedBytesCount: 0,
            droppedPacketsCount: 0,
            packetsCount: Faker::Number.between(from: 1, to: 999_999)
          },
          bandwidth: Faker::Number.between(from: 1, to: 999_999),
          connectionType: 0,
          creationTimestamp: Faker::Number.decimal(l_digits: 2),
          customData: nil,
          farIp: Faker::Internet.ip_v4_address,
          farPort: Faker::Number.between(from: 1, to: 65_536),
          dashSettings: {
            bandwidth: 0,
            chunkBaseName: 'dummy',
            chunkLength: 1,
            chunkOnIDR: true,
            cleanupDestination: false,
            configId: 2,
            dynamicProfile: true,
            groupName: Faker::Lorem.word,
            groupTargetFolder: Faker::File.file_name(dir: Faker::Lorem.word),
            keepAlive: true,
            localStreamName: Faker::TvShows::GameOfThrones.house,
            manifestName: "#{Faker::Lorem.word}.#{Faker::Lorem.word}",
            operationType: 6,
            overwriteDestination: true,
            playlistLength: 5,
            playlistType: %w[rolling appending].sample,
            staleRetentionCount: 5,
            targetFolder: Faker::File.file_name(dir: Faker::Lorem.word, name: Faker::TvShows::GameOfThrones.city, ext: Faker::Color.color_name)
          },
          ip: Faker::Internet.ip_v4_address,
          name: "#{Faker::Games::Zelda.character}_#{Faker::Number.between(from: 1, to: 999)}",
          nearIp: Faker::Internet.ip_v4_address,
          nearPort: Faker::Number.between(from: 1, to: 65_536),
          outStreamsUniqueIds: nil,
          port: Faker::Number.between(from: 1, to: 65_536),
          processId: Faker::Number.between(from: 1, to: 999),
          processType: 'origin',
          queryTimestamp: Faker::Number.decimal(l_digits: 3),
          type: 'INP',
          typeNumeric: Faker::Number.between(from: 1, to: 999_999_999),
          uniqueId: 2,
          upTime: Faker::Number.decimal(l_digits: 3),
          userAgent: 'Lavf56.40.101',
          video: {
            bytesCount: Faker::Number.between(from: 1, to: 999_999),
            codec: 'VH264',
            codecNumeric: Faker::Number.between(from: 1, to: 999_999_999),
            droppedBytesCount: 0,
            droppedPacketsCount: 0,
            height: Faker::Number.between(from: 1, to: 999),
            level: Faker::Number.between(from: 1, to: 999),
            packetsCount: Faker::Number.between(from: 1, to: 999),
            profile: Faker::Number.between(from: 1, to: 999),
            width: Faker::Number.between(from: 1, to: 999)
          }
        },
        processId: Faker::Number.between(from: 1, to: 999_999),
        timestamp: Faker::Number.between(from: 1, to: 999_999),
        type: 'outStreamCreated'
      }
    end

    context 'when payload is correct' do
      let(:type) { body[:type] }
      let(:payload) { body[:payload] }
      let(:type_stream) { 'Dash' }

      include_examples 'payload is correct', false
    end

    context 'when payload isn\'t correct' do
      let(:body) { Faker::Lorem.paragraph }
      let(:type) { Faker::Games::Zelda.character }
      let(:payload) { Faker::Games::Zelda.game }

      include_examples 'payload isn\'t correct'
    end
  end
end
