//teacher's config
// how to run the tests on different environments?

function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'int';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    postService: 'https://jsonplaceholder.typicode.com'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config.postService = 'http://localhost:3000'
  } else if (env == 'e2e') {
    // customize
    config.postService = 'https://jsonplaceholder.typicode.com'
  }
  karate.configure('connectTimeout', 8000)
  karate.configure('readTimeout', 5000)
  return config;
}