'use strict';

exports.domains = function(req, res) {
  res.send('user ' + req.params.id);
};
