module Ahoy
  module Translator

    def self.track_event(event)
      klass = third_party_service
      return "🤬 third party service not found" unless klass
      klass.track_event(event)
    end

    def self.track_visit(visit)
      klass = third_party_service
      return "🤬 third party service not found" unless klass
      klass.track_visit(visit)
    end

    def self.third_party_service
      if Ahoy.third_party_service == :segment
        klass = Ahoy::Translator::Segment
      end
    end
  
  end
end