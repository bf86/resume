# Definitions for how to categorize incoming HTTP requests

def get_benign_defs
  [
    'GET / '
  ]
end


def get_consumer_defs
  [
    'GET /api/pg/apps ',
    'GET /api/pg/projects ',
    'GET /api/pg/skills ',
    'GET /api/pg/skill-types ',
    'GET /api/pg/titles ',
    'GET /api/pg/education '
  ]
end

def get_crawler_defs
  [
    'GET /autodiscover',
    'GET /cdn-cgi/trace',
    'GET /robots.txt ',
    'scaninfo@paloaltonetworks.com',
    'MGLNDD'
  ]
end


def suspicious_defs
  [
    'GET /cdn-cgi/trace',
    'GET /login',
    'GET /manager/text/list',
    'GET /owa/auth',
    '/.well-known/security.txt',
    '/geoserver/web/',
    '/hudson',
    'MGLNDD'
  ]
end

def get_data_attempt_defs
  [
    '.env',
    '.git',
    '.php', # because this isn't a php app
    '/actuator',
    '/admin',
    '/boaform',
    '/config',
    '/remote',
    '/wsman'
  ]
end
