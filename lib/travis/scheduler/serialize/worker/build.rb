require 'forwardable'

module Travis
  module Scheduler
    module Serialize
      class Worker
        class Build < Struct.new(:build, :config)
          extend Forwardable

          def_delegators :build, :id, :request, :number, :event_type,
            :pull_request_number

          def pull_request?
            event_type == 'pull_request'
          end
        end
      end
    end
  end
end
