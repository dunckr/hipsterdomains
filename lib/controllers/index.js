'use strict';

var path = require('path');

exports.partials = function(req, res) {
  var stripped = req.url.split('.')[0];
  var requestedView = path.join('./', stripped);
  res.render(requestedView, function(err, html) {
    if(err) {
      res.render('404');
    } else {
      res.send(html);
    }
  });
};

exports.index = function(req, res) {
  // console.log(req.url);
  // var url = req.url;
  // var file = url.split('/').pop();
  // var ext = file.split('.').pop();
  // console.log(ext);

  // if (ext === 'png') {
  //   res.set('Content-Type', 'image/png');
  // }

  res.render('index');
};
