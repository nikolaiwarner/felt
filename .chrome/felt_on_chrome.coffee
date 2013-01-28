# Clickable icon
chrome.browserAction.onClicked.addListener (tab) =>
  if @available
    chrome.tabs.create(url: "http://localhost:3000")
  else
    chrome.tabs.create(url: "options.html")
