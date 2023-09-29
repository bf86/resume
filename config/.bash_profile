# Default config
source $HOME/.bashrc

# Vars

# Docker functions
function dbash() { sudo docker exec -it $1 bash; }
function dlo() { sudo docker logs $1; }
function drs() { sudo docker restart $1; }
function dps() { sudo docker ps -a; }
function drf() { # - docker redeploy full
  sudo docker-compose -f $HOME/resume/compose/production.yml stop;
  sudo docker-compose -f $HOME/resume/compose/production.yml rm -f;
  sudo docker-compose -f $HOME/resume/compose/production.yml up -d;
}

# Shell functions
function res() { source $HOME/.bash_profile; } # resource
