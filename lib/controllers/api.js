'use strict';

var dns = require('dns');

exports.domains = function(req, res) {
  var id = req.params.id;
  if (!/^[a-zA-Z1-9]+$/.test(id)) {
    res.send({'availability': false});
  }
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
