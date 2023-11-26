/*
  For staging and production, API URI is set on build in ${RESUME_PATH}/deploy/2_code-copy.sh:
  REACT_APP_API_URI=$deploy_host npm run build

  For local development, this file overrides the default http://localhost:3000

  There is probably a way to do this more natively, but I have not found it yet
*/

export default process.env.NODE_ENV === 'development' ? 'http://localhost' : '';
