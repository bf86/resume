# Returns an array of strings that suggest a possibly malicious request

def get_data_attempt_defs()
  [
    '.env',
    '.git',
    '.php', # because this isn't a php app
    '/actuator',
    '/admin',
    '/boaform',
    '/config',
    '/remote'
  ]
end
