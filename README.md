# plonk

This is the tiniest possible way I can find to run node / yarn / webpack in a container instead of installing it in my workspace.


## Usage

1. Put the `plonk` script in your path.
1. Run `plonk <command>` to run `<command>` in the plonk container (where node, yarn & webpack are available).

Note that local node modules required by your package.lock are installed to `~/.local/<project>` instead of `./node_modules/` in your working directory. This is more like other tools like pipx that manage those environments for you.
