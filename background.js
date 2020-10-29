// var port = browser.runtime.connectNative("bash_interface");
var port = browser.runtime.connectNative("ruby_interface");

port.onMessage.addListener((response) => {
  console.log("Received: ", response);
  if (response != "") {
    browser.tabs.get(parseInt(response.id)).then(raiseTab, onError);
  }
});

// function portDisconnectListener(port) {
//   console.warn(port);
//   console.warn(browser.runtime.lastError);
//   console.warn(browser.runtime.lastError);
//   console.warn(port.error);
// }
// port.onDisconnect.addListener(portDisconnectListener);

// port.onDisconnect.addListener((p) => {
//   if (p.error) {
//     console.log(`Disconnected due to an error: ${p.error.message}`);
//   }
// });

function onError(error) {
  console.error(error);
}

const getTabMenu = () => {
  return new Promise((resolve, reject) => {
    browser.tabs.query({}, (tabs) => {
      const menu = {}
      for (const tab of tabs) {
        const key = `${tab.title} ${tab.url} ${tab.id}`
        menu[key] = tab
      }
      resolve(menu)
    })
  })
}

function raiseTab(tab) {
  browser.tabs.update(tab.id, { active: true });
  browser.windows.update(tab.windowId, { focused: true });
}

function sendTabList(tabs) {
  browser.windows.getCurrent().then(function (win) {

    var tabdata = tabs.map((t) => {
      return {
        id: t.id,
        window: t.windowId,
        title: t.title,
        url: t.url,
        active: t.active
      };
    });
    var data = { tabs: tabdata };
    console.log({ data });
    port.postMessage(data);
  });
}

browser.commands.onCommand.addListener(function (command) {
  if (command == "switch-tab") {
    console.log("Querying tabs");
    browser.tabs.query({}).then(sendTabList, onError);
    // port.postMessage(getTabMenu());
  }
});
