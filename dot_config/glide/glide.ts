// Config docs:
//
//   https://glide-browser.app/config
//
// API reference:
//
//   https://glide-browser.app/api
//
// Default config files can be found here:
//
//   https://github.com/glide-browser/glide/tree/main/src/glide/browser/base/content/plugins
//
// Most default keymappings are defined here:
//
//   https://github.com/glide-browser/glide/blob/main/src/glide/browser/base/content/plugins/keymaps.mts
//
// Try typing `glide.` and see what you can do!


glide.autocmds.create(
  "UrlEnter",
  /.*(discord\.com|chatgpt\.com).*/,
  () => {
    glide.excmds.execute("mode_change normal");
  }
);

glide.keymaps.set("normal", "<C-c>", async () => {
    const url = "https://chatgpt.com/";
    browser.tabs.create({url, active: true });
})

glide.keymaps.set("normal", "tt", async () => {
  const tab = await glide.tabs.active();
  const url_string = tab.url ?? "";
  const url =
    "https://translate.google.com/translate?sl=auto&tl=ja&u=" +
    encodeURIComponent(url_string);
  browser.tabs.update({ url, active: true });
});

glide.keymaps.del(["normal", "insert", "visual", "ignore"], "<S-Esc>");
glide.keymaps.set(["normal", "insert", "visual"], "<C-g>", "mode_change ignore");
glide.keymaps.set("ignore", "<C-g>", "mode_change normal");
glide.keymaps.set("normal", "<leader>r", "config_reload");
glide.keymaps.set("visual", "vv", "mode_change normal");
glide.keymaps.set("normal", "f", "hint --include=\"img,svg\"");

glide.keymaps.set("normal", "J", "tab_next");
glide.keymaps.set("normal", "K", "tab_prev");
glide.keymaps.set("normal", "H", "back");
glide.keymaps.set("normal", "L", "forward");
glide.keymaps.set("insert", "<C-h>", async () => {
    glide.keys.send('<left>');
});
glide.keymaps.set("insert", "<C-l>", async () => {
    glide.keys.send('<right>');
});
glide.keymaps.set("insert", "<C-j>", async () => {
    glide.keys.send('<down>');
});
glide.keymaps.set("insert", "<C-k>", async () => {
    glide.keys.send('<up>');
});
glide.excmds.create(
  { name: "man", arg_count: "+" },
  async (props) => {
    const query = props.args_arr.join(" ").trim();
    if (!query) return;

    const url =
      "https://www.google.com/search?q=" +
      encodeURIComponent(`${query} site:man7.org/linux/man-pages`);

    await browser.tabs.create({ url, active: true });
  }
);

glide.excmds.create(
  { name: "mancpp", arg_count: "+" },
  async (props) => {
    const query = props.args_arr.join(" ").trim();
    if (!query) return;

    const url =
      "https://www.google.com/search?q=" +
      encodeURIComponent(
        `${query} site:en.cppreference.com OR site:cplusplus.com`
      );

    await browser.tabs.create({ url, active: true });
  }
);

