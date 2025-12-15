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
  /.*discord\.com.*/,
  () => {
    glide.excmds.execute("mode_change normal");
  }
);

glide.keymaps.set("normal", "tt", async () => {
  const tab = await glide.tabs.active();
  const url_string = tab.url ?? "";
  const url =
    "https://translate.google.com/translate?sl=auto&tl=ja&u=" +
    encodeURIComponent(url_string);
  browser.tabs.update({ url, active: true });
});

glide.keymaps.del("normal", "<S-Esc>")
glide.keymaps.del("ignore", "<S-Esc>")
glide.keymaps.set("normal", "<C-g>", "mode_change ignore");
glide.keymaps.set("ignore", "<C-g>", "mode_change normal");
glide.keymaps.set("normal", "<leader>r", "config_reload");
glide.keymaps.set("visual", "vv", "mode_change normal");
glide.keymaps.set("normal", "f", "hint --include=\"img,svg\"");

glide.keymaps.set("normal", "J", "tab_next");
glide.keymaps.set("normal", "K", "tab_prev");
glide.keymaps.set("normal", "H", "back");
glide.keymaps.set("normal", "L", "forward");
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
