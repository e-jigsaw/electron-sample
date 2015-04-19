require! {
  app
  \browser-window : BrowserWindow
  \crash-reporter : crashReporter
  \global-shortcut : globalShortcut
}

crashReporter.start!

mainWindow = null

app.on \window-all-closed, ->
  if process.platform isnt \darwin then app.quit!

app.on \ready, ->
  mainWindow = new BrowserWindow do
    width: 800
    height: 600

  mainWindow.loadUrl "file://#{__dirname}/index.html"
  mainWindow.on \closed, ->
    mainWindow = null

  globalShortcut.register \VolumeUp, -> console.log \up
  globalShortcut.register \VolumeDown, -> console.log \down
