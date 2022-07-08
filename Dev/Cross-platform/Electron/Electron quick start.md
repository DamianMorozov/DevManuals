# Electron quick start
- [electron-quick-start on Github](https://github.com/electron/electron-quick-start)

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back to the Readme page](README.md)

# Electron quick start template
```
# Clone this repository
git clone https://github.com/electron/electron-quick-start
# Go into the repository
cd electron-quick-start
# Install dependencies
npm install
# Run the app
npm start
```


# Prerequisites
```
node -v
npm -v
```


# Create your Electron application
```
mkdir my-electron-app && cd my-electron-app
npm init
```

## Install the electron package
```
npm install --save-dev electron
```

## Create and edit the index.html
```
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Hello World!</title>
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline';" />
  </head>
  <body>
    <h1>Hello World!</h1>
    <p>
        We are using Node.js <span id="node-version"></span>,
        Chromium <span id="chrome-version"></span>,
        and Electron <span id="electron-version"></span>.
    </p>
  </body>
</html>
```

## Create and edit the main.js
```
const { app, BrowserWindow } = require('electron')
const path = require('path')

function createWindow () {
  const win = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js')
    }
  })

  win.loadFile('index.html')
}

app.whenReady().then(() => {
  createWindow()

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow()
    }
  })
})

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})
```

## Create and edit the preload.js
```
window.addEventListener('DOMContentLoaded', () => {
  const replaceText = (selector, text) => {
    const element = document.getElementById(selector)
    if (element) element.innerText = text
  }

  for (const type of ['chrome', 'node', 'electron']) {
    replaceText(`${type}-version`, process.versions[type])
  }
})
```

## Edit the package.json
```
  "main": "main.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "electron ."
  },
```

## Start
```
npm start
```


# Package and distribute your Electron application

## Add Electron Forge as a development dependency of your app
```
npm install --save-dev @electron-forge/cli
npx electron-forge import
```

## Create a distributable using Forge's
```
npm run make
```
