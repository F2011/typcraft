# Architecture

Jotting down some ideas:
- [The Elm Architecture](https://guide.elm-lang.org/architecture/) seems like a good starting point, and nice way to get the site running too.
- There is some interesting discourse on gluing rust and js/wasm to interact
  - I remember the last time I looked into this app I was considering some bespoke Typst js library or something
  - I would much rather just use the Typst binary or use some Rust cargo installation to wasm and then display the resulting svg files onto the browser. 
  - The loop for this seems ideally straightforward, and I can inject stuff into the Typst compiler input (using many of the parsing capabilities of the functional nature of Elm) to make it fit the style of the page itself too.
  - Perhaps I can also look to Wypst as to how it achieved this.