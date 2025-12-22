.PHONY: build build-wasm build-elm dev clean deploy

# Build everything
build: build-wasm build-elm build-favicon

# Build WASM module
build-wasm:
	cd wasm && wasm-pack build --target web --out-dir ../public/pkg

# Build Elm
build-elm:
	elm make src/Main.elm --output=public/elm.js

# Build Favicon
build-favicon:
	cd icon && typst compile -f svg logo.typ && convert logo.svg -define icon:auto-resize=16,32,48,64,256 logo.ico && cp logo.ico ../public/favicon.ico

# Development server
dev: build
	bunx serve public -p 8000

# Deploy to gh-pages branch
deploy: build
	git add -f public
	git commit -m "Build for deploy" --allow-empty
	git subtree push --prefix public origin gh-pages

# Clean build artifacts
clean:
	rm -rf public/pkg
	rm -rf public/elm.js
	rm -rf wasm/target
	rm -rf wasm/pkg
	rm -rf result


