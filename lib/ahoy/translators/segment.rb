module Ahoy
  module Translator
    module Segment
    
      def self.track_visit(visit)
        Rails.logger.info "Visit not implemented."
      end

      def self.track_event(event)
        if event.user
          Analytics.track(
            user_id: event.user_id, 
            event: event.name,
            properties: event.properties,
            context: context(event.visit)
          )
        else
          Analytics.track(
            anonymous_id: event.visit.visitor_token,
            event: event.name,
            properties: event.properties,
            context: context(event.visit)
          )
        end
        Rails.logger.info "✅ sent event #{event.id} to segment"
      end

      def self.context(visit)
        {
          ip: visit.ip,
          user_agent: visit.user_agent,
          device_type: visit.device_type,
          browser: visit.browser,
          referrer: visit.referrer,
          referring_domain: visit.referring_domain,
          landing_page: visit.landing_page,
          utm_source: visit.utm_source,
          utm_medium: visit.utm_medium,
          utm_term: visit.utm_term,
          utm_content: visit.utm_content,
          utm_campaign: visit.utm_campaign
        }
      end

    end
  end
end