require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import $ from 'jquery';
import "bootstrap";

$( document ).ready(function() { $("#query").focus(); });
document.addEventListener('turbolinks:load', () => {
  // console.log("test");
 $('.carousel').carousel()
});

