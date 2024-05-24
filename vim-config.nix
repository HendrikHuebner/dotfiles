with import <nixpkgs> {};

vim_configurable.customize {
    name = "vim";
    
    vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [
            vim-nix
            vim-lastplace
            vim-sensible
            gruvbox
            nerdtree
            vim-nerdtree-tabs
            nerdtree-git-plugin

            vim-commentary
            vim-surround
            vim-snippets
            vim-airline
            vim-fugitive
            indentLine
            delimitMate
            YouCompleteMe
            ale
            vim-cpp-enhanced-highlight
        ];
        opt = [];
    };


    vimrcConfig.customRC = (builtins.readFile ./.vimrc);
     
}
