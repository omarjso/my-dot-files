FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    git curl ripgrep zsh tmux unzip fzf build-essential \
 && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt-get install -y nodejs \
 && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/junegunn/fzf.git /opt/fzf \
 && /opt/fzf/install --bin --no-update-rc \
 && ln -s /opt/fzf/bin/fzf /usr/local/bin/fzf

RUN curl -fL --retry 5 --retry-delay 5 -o nvim.tar.gz \
    https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz \
 && tar xzf nvim.tar.gz \
 && rm nvim.tar.gz \
 && mv nvim-linux-x86_64 /opt/nvim \
 && ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

WORKDIR /root

COPY . /root/dot_files
RUN chmod +x /root/dot_files/createSymlinks.sh && \
    /root/dot_files/createSymlinks.sh

# Pre-install lazy.nvim plugins
# TODO: Currently this step isn't cached becuase the above copy is updated
# everytime the dot_files are changed. This can be decoupled via locking
# the lazy version via :Lazy Lock or some like that
RUN nvim --headless "+Lazy! install" +qa

WORKDIR /root/work
CMD ["zsh"]
