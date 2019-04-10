This docker has a vim configured with Tlist,NERDTree,source explorer. And using zsh with oh-my-zsh instead of bash.

0. prepare:
    ```
    mkdir vim
    cd vim/
    git clone https://github.com/oska874/vim-plugins.git
    ```
1. build:
    `docker build -t vimer:2019.4 .`
2. run:
    `docker run -it -v $HOME/awork:/home/vimer/project vimer:2019.4 /bin/zsh`



