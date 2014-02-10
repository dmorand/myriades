chrome.app.runtime.onLaunched.addListener(function(launchData) {
  chrome.app.window.create('html/myriades.html', {
    'id': '_mainWindow', 'bounds': {'width': 1280, 'height': 720 }
  });
});
