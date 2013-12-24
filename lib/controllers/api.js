'use strict';

var dns = require('dns');
// var fs = require('fs');

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


// var file =  './lib/assets/suffix.json';
// var suffixes = function() {
//   fs.readFile(file, 'utf8', function (err, data) {
//     if (err) {
//       console.log('Error: ' + err);
//       return;
//     }
//     data = JSON.parse(data);
//     console.log(data);
//     return data;
//   });
// };

// // just get the first command argument
// var term = process.argv[2];
// if (typeof term === 'undefined') {
//   console.log('no arguments');
//   process.exit(1);
// }

// // get the list of possibilities
// // into array
// var f = 'assets/suffix.txt';
// var list = read(f);


// for (var i = term.length; i >= 2; i--) {
//   var trying = term.substr(0, i);
//   search(trying, list);
// }


// // try all of them against the term
// function search(term, list) {
//   for (var i in list) {
//     check(term + list[i]);
//   }
// }

// // Check particular domain name is available
// function check(d, callback) {
//   var domain = 'www.' + d + '.com';
//   dns.resolve4(domain, function(err, addresses) {
//     if (err) {
//       if (err.code === 'ENOTFOUND') {
//         console.log(domain);
//       }
//     }
//   });
// }

