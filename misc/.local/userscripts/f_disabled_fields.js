// ==UserScript==
// @name         f disabled fields
// @namespace    http://tampermonkey.net/
// @version      0.1
// @author       chrsm
// @match      *://*/*
// @grant        none
// ==/UserScript==

(function() {
  'use strict';

  function fyou(_, __) {
    document.querySelectorAll('[disabled]').forEach(function(v) {
      v.setAttribute('disabled', false);
      v.setAttribute('readonly', true);
    });
  }

  (new MutationObserver(fyou)).observe(document, { childList: true, subtree: true });
})();
