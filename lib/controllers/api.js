'use strict';

var dns = require('dns');

exports.domains = function(req, res) {
  console.log('here');
  var id = req.params.id;
  var domain = 'www.' + id + '.com';

  dns.resolve4(domain, function(err) {
    if (err) {
      if (err.code === 'ENOTFOUND') {
        res.send({'availability': true});
      }
    } else {
      res.send({'availability': false});
    }
  });
};
