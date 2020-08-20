// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// External imports
import "bootstrap"
import "../components/hide_on_scroll.js"
import "../components/filter_on_search.js"

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete.js';

document.addEventListener('turbolinks:load', () => {
  // initMapbox();
  initAutocomplete();
})


const Turbolinks = require("turbolinks")
Turbolinks.start()
