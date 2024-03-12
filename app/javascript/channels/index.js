// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context(".", true, /_channel\.js$/);
channels.keys().forEach(channels);

let a = 3;
// function myFunction() {
//   let a = 4;
//   console.log(a);
// }
