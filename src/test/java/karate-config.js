function fn() {
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  //var env = karate.env; // get system property 'karate.env'
  //karate.log('karate.env system property was:', env);
  //if (!env) {
  env = 'dev';
  //}
  var config = {
    env: env,
    ssl: true,
    AMLEndpoint: 'https://eun-d-sit05.napier.ai:443',
    Janus: 'https://eun-d-sit05-app-01.napier.ai:42003',
    Username: 'support@napier.ai',
    Password: 'HfijMaGF3Wcrn4lzpHs=',
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}