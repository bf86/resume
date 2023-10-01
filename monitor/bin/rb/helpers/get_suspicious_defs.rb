# Returns an array of strings that suggest a possibly malicious request

def suspicious_defs()
  [
    '/.well-known/security.txt',
    '/geoserver/web/',
    '/hudson',
    '/robots.txt',
    'searches across the global',
    'MGLNDD_34.150.128.93_443'
  ]
end
