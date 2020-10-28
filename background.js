// var port = chrome.runtime.connectNative("bash_interface");
var port = chrome.runtime.connectNative("ruby_interface");

port.onMessage.addListener((response) => {
  console.log("Received: ", response);
  if (response != "") {
    chrome.tabs.get(parseInt(response.id)).then(raiseTab, onError);
  }
});

// function portDisconnectListener(port) {
//   console.warn(port);
//   console.warn(chrome.runtime.lastError);
//   console.warn(chrome.runtime.lastError);
//   console.warn(port.error);
// }
// port.onDisconnect.addListener(portDisconnectListener);

// port.onDisconnect.addListener((p) => {
//   if (p.error) {
//     console.log(`Disconnected due to an error: ${p.error.message}`);
//   }
// });

// function onError(error) {
//   console.log(error);
// }

const getTabMenu = () => {
  return new Promise((resolve, reject) => {
    chrome.tabs.query({}, (tabs) => {
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
  chrome.tabs.update(tab.id, { active: true });
  chrome.windows.update(tab.windowId, { focused: true });
}

function sendTabList(tabs) {
  chrome.windows.getCurrent().then(function (win) {

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

chrome.commands.onCommand.addListener(function (command) {
  if (command == "switch-tab") {
    console.log("Querying tabs");
    // chrome.tabs.query({}).then(sendTabList, onError);
    port.postMessage(getTabMenu());
  }
});
