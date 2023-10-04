const projectDef = `[
  {
    name: String,
    description: String,
    role: String,
    organization: String
  },
  ...
]

name: Project name (generally an official name within organization
  or team, in some cases an individual project),
role: My role on project (generally my title, sometimes duck typed
  e.g. consulting on one project while being a senior dev on another),
`;

export default projectDef;
