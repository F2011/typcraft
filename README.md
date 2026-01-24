# typcraft

[typcraft](https://typcraft.nxtdroid.win) is a website to practice composing equations with the [typst](https://typst.app) typesetting system. 

Inspired by [texnique.xyz](https://texnique.xyz) which does the same for LaTeX.

You can also just use it as a live `typst` code preview in the browser. It uses the full typst compiler running in WebAssembly, and outputs to SVG.

> You are encouraged to read [ARCHITECTURE.md](./ARCHITECTURE.md) if you would like to know more about how it all works

## Development

You need to have [nix](https://nixos.org/download/) on your system, it takes care of all the dependencies.

```bash
# Clone repository
git clone https://github.com/arjdroid/typcraft
cd typcraft

# Enter development environment
nix develop

# Preview changes using bun
make dev

# Push changes to github-pages
make deploy
```

## Todo
- [x] get `typst` running in the browser
- [x] get live preview working
- [x] get formula checking working
- [ ] add more equations, better randomisation with difficulty levels
- [ ] add links to guides
- [ ] add shadow mode
- [ ] add playground mode

> Acknowledgement: The development of this project was assisted by the use of Claude Code (Claude Opus 4.5, Anthropic)
