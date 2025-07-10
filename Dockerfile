FROM archlinux
RUN echo 'Server = https://mirror.ufscar.br/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist \
    && pacman -Syyu --noconfirm --noprogressbar --quiet \
    && pacman-key --init \
    && pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com \
    && pacman-key --lsign-key 3056513887B78AEB \
    && pacman --noconfirm --noprogressbar -U 'https://mirror.ufscar.br/chaotic-aur/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
    && echo -e '[chaotic-aur]\nServer = https://mirror.ufscar.br/$repo/$repo/$arch' >> /etc/pacman.conf \
    && pacman -Syyu --noconfirm --noprogressbar --quiet \
    && pacman -S --noconfirm --noprogressbar --quiet openmpi openems-git csxcad-git qcsxcad-git appcsxcad-git python-openems-git python-csxcad-git python-matplotlib \
    && rm -rf /var/lib/pacman/sync/* \
    && rm -rf /var/cache/pacman/*
