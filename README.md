# My Configs (fernandofrali - MacOSX)

This is my nvim configs that I usually update with new plugins and keybinds. Be free to use if you like!

_I only have tested on MacOS, so I can't guarantee that this works on Linux/Windows too._

## Warnings:
- this folder goes on your ~/.config folder**

- maybe your NPM have some bugs with permission when installing packages using Mason. To prevent this, use: `sudo chown -R 501:20 "/Users/YOUR_USERNAME_HERE/.npm"`**

OBS: if that doesn't work for you, maybe the group or user id is wrong. Try to replace '501' with your user id and '20' with your user group. Below have a tutorial to see that info:

```sh
id -g -n YOUR_USERNAME # to see your user's group
getent group YOUR_GROUP # to see your group id
id -u YOUR_USERNAME # to see your user id
```

## How to install:

1. install nvim ```brew install nvim``` (obs: remember to ALWAYS update your nvim to the latest version, like: brew update && brew upgrade nvim)
2. install ripgrep ```brew install ripgrep```
3. install packer:
```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
- in your ~/.config folder, run these following commands:
```
// use command below to start nvim. But you'll get some errors, just type G (capital) and then go Enter to ignore:

nvim . 

// Now you need to sync all plugins:

:lua require('fernandofrali.packer')
:so
:PackerSync

// now, just quit and reopen nvim
```
4. set an alias to nvim (I like to use "vim"):
    - ```alias vim="nvim"``` (on .zshrc)
    - ```git config --global core.editor nvim```
5. install github copilot (deprecated, use supermaven):

          git clone https://github.com/github/copilot.vim.git \
            ~/.config/nvim/pack/github/start/copilot.vim


    then start NVim and invoke ```:Copilot setup```
6. install tmux ```brew install tmux```
7. install tmux-tpm ```git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm```
8. create a tmux.conf in ~/.config/tmux/tmux.conf with these configs
 ```
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf
      setw -g mode-keys vi
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'christoomey/vim-tmux-navigator'
      run '~/.tmux/plugins/tpm/tpm'

 ```
now save and run `tmux`

after that, press ```CTRL + B``` and ```I``` (capital i) to install tmux packages

obs: you DON'T need to press all keys together. Just press `CTRL + B` and after press `I` (need to be capitalized!).
<br>
obs²: `CTRL + B` is the default PREFIX in tmux. Check if you haven't changed that!

9. install vscode-js-debug (only if you use typescript/javascript):


```
git clone https://github.com/microsoft/vscode-js-debug ~/.local/share/nvim/site/vscode-js-debug
cd ~/.local/share/nvim/site/vscode-js-debug
sudo npm install --legacy-peer-deps
npx gulp vsDebugServerBundle
mv dist out
```

obs: you need to change on  `~/.config/nvim/after/plugin/nvim-dap.lua` the `debugger_path` to your user location (e.g Users/fernandofrali to Users/your_user).
Try to search for all "fernandofrali" and replace it with your user name.

- finally, run ```:PackerSync``` (and :Mason if you haven't already)

## Additional info:

Doc for config the debugger to Rust:
https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb)
