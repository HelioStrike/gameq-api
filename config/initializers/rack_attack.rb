# Lockout data spammers
# After 100 requests in 1 minute, block all requests from that IP for 1 hour.
Rack::Attack.blocklist('allow2ban login scrapers') do |req|
    Rack::Attack::Allow2Ban.filter(req.ip, maxretry: 100, findtime: 1.minute, bantime: 1.hour) do
      req.path == '/graphql'?
    end
end

Rack::Attack.blocklisted_callback = lambda do |request|
    # Using 503 because it may make attacker think that they have successfully
    # DOSed the site. Rack::Attack returns 403 for blocklists by default
    [ 503, {}, ['Blocked']]
end

LOGGER = Logger.new('log/rack-attack.log')
ActiveSupport::Notifications.subscribe('rack.attack') do |_name, _start, _finish, _request_id, req|
    req = req[:request]
    msg = [req.env['rack.attack.match_type'], req.ip, req.request_method, req.fullpath, ('"' + req.user_agent.to_s + '"')].join(' ')
    if %i[throttle blocklist].include?(req.env['rack.attack.match_type'])
        LOGGER.error(msg)
    else
        LOGGER.info(msg)
    end
end