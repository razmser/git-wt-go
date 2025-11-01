# Build the git-wt binary
build:
    go build .

# Run checks (format, vet, test)
check:
    go fmt .
    go vet .
    go test ./...

# Clean build artifacts
clean:
    rm -f gwt

install: build
    @mkdir -p ~/.local/bin
    @mkdir -p ~/.config/fish/functions
    @mkdir -p ~/.config/fish/completions
    @cp gwt ~/.local/bin
    @cp wrapper.fish ~/.config/fish/functions/gwt.fish
    @cp autocomplete.fish ~/.config/fish/completions/gwt.fish
    @echo "Installed gwt to ~/.local/bin/gwt"
    @echo "Installed gwt function to ~/.config/fish/functions/gwt.fish"
    @echo "Installed gwt completions to ~/.config/fish/completions/gwt.fish"

# Show available commands
help:
    @just --list
