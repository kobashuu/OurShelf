RakutenWebService.configuration do |c|
    # (Required) Appliction ID for your application.
c.application_id = '1045904948228331289'

# (Optional) Affiliate ID for your Rakuten account.
c.affiliate_id = '16c94699.21456da1.16c9469a.9238ab9e' # default: nil

# (Optional) # of retries to send requests when the client receives
# When the number of requests in some period overcomes the limit, the endpoints will return
# too many requests error. Then the client tries to retry to send the same request after a
# while.
c.max_retries = 3 # default: 5

# (Optional) Enable debug mode. When set true, the client streams out all HTTP requests and
# responses to the standard error.
c.debug = true # default: false
end
