FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    neovim git curl ripgrep zsh \
 && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/zsh omarjso
USER omarjso
WORKDIR /home/omarjso

COPY --chown=omarjso:omarjso . /home/omarjso/dotfiles

RUN chmod +x dotfiles/createSymlinks.sh && \
    ./dotfiles/createSymlinks.sh

WORKDIR /home/omarjso/work
