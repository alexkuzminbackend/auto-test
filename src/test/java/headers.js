function fn() {
  var token = karate.get('token');
  if (token) {
    return {
        Authorization: 'Basic ' + token
    };
  } else {
    return {};
  }
}
