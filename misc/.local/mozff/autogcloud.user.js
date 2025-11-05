// ==UserScript==
// @name         Auto-Accept Google Cloud SDK
// @namespace   Violentmonkey Scripts
// @version      2025-10-22
// @description  auto-accept signin for gcloud sdk
// @author       chrsm
// @include      /^https://accounts.google.com/signin/oauth/consent.+client_id=32555940559\.apps\.googleusercontent\.com.+$/
// @icon         https://www.google.com/s2/favicons?sz=64&domain=google.com
// @grant        unsafeWindow
// @grant        GM.addElement
// ==/UserScript==

const d = unsafeWindow.document;

const root_marker = d.querySelector('#developer_info_glif');
if (!root_marker || root_marker.textContent != 'Google Cloud SDK' || root_marker.dataset.thirdPartyEmail != 'google-cloud-sdk@googlegroups.com') {
  return;
}

const allow = d.querySelector('#submit_approve_access');
if (!allow || allow.textContent != 'Allow') {
  return;
}

allow.querySelector('button').click();
