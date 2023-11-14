# [Brian86.dev](https://brian86.dev)

## Endpoints
- [/api/pg/apps](https://brian86.dev/api/pg/apps)
- [/api/pg/projects](https://brian86.dev/api/pg/projects)
- [/api/pg/skills](https://brian86.dev/api/pg/skills)
- [/api/pg/titles](https://brian86.dev/api/pg/titles)
- [/api/pg/education](https://brian86.dev/api/pg/education)

## Tech Stack
- Google Virtual Private Cloud
- E2 Micro Ubuntu VM
- Docker
  - PostgreSQL Database
  - NodeJS (Fastify) API
  - React UI
  - Nginx Reverse Proxy + SSL
- Google Cloud Firewall

## Releases
- 2023-11-14 09:40 0.1.8 Add basic loading states
- 2023-11-11 19:50 0.1.7 Add FAQ, minor README changes
- 2023-11-02 08:02 0.1.6 Fix endpoint tests and recommendations mobile layout
- 2023-10-21 08:35 0.1.5 Add recommendations, top margin
- 2023-10-11 21:03 0.1.4 Fix production layout
- 2023-10-09 11:07 0.1.3 Improve skills view
- 2023-10-09 10:21 0.1.2 Mobile friendly layout
- 2023-10-08 21:42 0.1.1 An actual front end sort of instead of API docs
- 2023-09-29 11:59 0.0.11 SSL for pg, create .bash_profile, add ncdu to provision script
- 2023-09-28 23:09 0.0.10 add basic monitoring scripts
- 2023-09-28 07:50 0.0.9 clean up response definitions
- 2023-09-27 20:55 0.0.8 add /education, minor html cleanup
- 2023-09-27 08:04 0.0.7 add release information
- 2023-09-27 00:55 0.0.6 add accordions to landing page for maximum polka
- 2023-09-26 23:40 0.0.5 add db seed script
- 2023-09-26 11:11 0.0.4 add rate limit, fix /projects link
- 2023-09-26 10:20 0.0.3 add /projects and /titles endpoints
- 2023-09-25 08:43 0.0.2 add pg endpoints and remove fixture endpoints
- 2023-09-24 09:26 0.0.1 initial release! skills and skill types endpoints, landing page

## Todo
- Rename skills to experience?
- Error handling
  - Invalid routes
  - 500s
- New endpoints
  - /hobbies
  - /releases
  - /opinions?
  - POST /interview XD
- Filter query params
- CLI? XD
- Re-implement with different tech stacks
  - MySQL (e.g. /api/mys/skills)
  - GraphQL
  - AWS
- World's smallest Kafka instance

## Contact
- brian.g.fink@gmail.com
- 617-460-5059
- [LinkedIn](https://www.linkedin.com/in/briangfink/)
