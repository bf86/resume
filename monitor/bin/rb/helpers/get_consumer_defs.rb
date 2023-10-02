# Returns an array of consumer requests

def get_consumer_defs()
  [
    'GET /api/pg/apps ',
    'GET /api/pg/projects ',
    'GET /api/pg/skills ',
    'GET /api/pg/skill-types ',
    'GET /api/pg/titles ',
    'GET /api/pg/education '
  ]
end
