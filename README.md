## My Configs (fernandofrali - MacOSX)

**OBS: this folder goes on your ~/.config folder**

- install nvim (brew install nvim)
- install ripgrep (brew install nvim)
- set an alias to nvim (I like to use vim):
    - alias vim="nvim" (on .zshrc)
    - git config --global core.editor nvim
- install github copilot
      ``` 
      git clone https://github.com/github/copilot.vim.git \
          ~/.config/nvim/pack/github/start/copilot.vim
      ```
    - start NVim and invoke :Copilot setup
- install tmux (brew install tmux)
- install tmux-tpm (git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm)
- create a tmux.conf in ~/.config/tmux/tmux.conf with theses configs
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
after that, use ```prefix (CTRL + B, if you didn't any change to keybinds) + I (capital i)``` to install tmux packages
obs: you DON'T need to press all keys together. Just press CTRL + B and after press I.

- install vscode-js-debug (only if you use typescript/javascript):


```
git clone https://github.com/microsoft/vscode-js-debug ~/.local/share/nvim/site/pack/packer/opt/vscode-js-debug
cd ~/.local/share/nvim/site/pack/packer/opt/vscode-js-debug
sudo npm install --legacy-peer-deps
npx gulp vsDebugServerBundle
mv dist out
```

 - run ```:PackerSync```
