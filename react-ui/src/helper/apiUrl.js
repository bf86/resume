const apiUrls = {
  development: 'http://localhost',
  test: 'http://localhost',
  production: 'https://brian86.dev'
};

export default apiUrls[process.env.NODE_ENV];
