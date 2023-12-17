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
