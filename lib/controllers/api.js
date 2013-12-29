'use strict';

var dns = require('dns');

var suffixes =
{
  'suffix': [
    'a',
    'ah',
    'e',
    'i',
    'o',
    'y',
    'ey',
    'er',
    'r',
    'ance',
    'al',
    'ery',
    'oid',
    'ious',
    'ize',
    'ism',
    'ist',
    'ish',
    'aholic',
    'able',
    'ient',
    'ion',
    'ly',
    'ify'
  ],
  'service': [
    'app'
  ]
};

var check = function(name, callback) {

  var domain = 'www.' + name + '.com';

  dns.resolve4(domain, function(err, addresses) {

    if (err) {

      console.log(err.code);

      if (err.code === 'ENOTFOUND') {
        callback(domain);
      }
    } else {
      // console.log(domain + ' is unavailable');
    }

  });
};

exports.domains = function(req, res) {
  var id = req.params.id;
  console.log('calling domains');

  for (var i = 0; i < suffixes.suffix.length; i++) {

    var url = 'www.' + id + suffixes.suffix[i] + '.com';

    check(url, function(domain) {
      console.log(domain + ' is available');
    });
  };


  res.send('user ' + id);
};
