FROM registry.gitlab.gnome.org/gnome/gnome-runtime-images/gnome:master

LABEL "com.github.actions.name"="Flatpak Builder"
LABEL "com.github.actions.description"="Build your flatpak project"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/bilelmoussaoui/flatpak-github-actions"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Bilal Elmoussaoui<bil.elmoussaoui@gmail.com>"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]