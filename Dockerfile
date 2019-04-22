FROM ubuntu:bionic

# install prerequisites
RUN apt-get update && apt-get install -y --no-install-recommends \
  curl unzip git vim make ctags cscope gcc g++

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash \
  && apt-get install -y nodejs

# clean up
RUN apt-get clean && apt-get purge \
  && rm -rf /var/lib/apt/lists

# set misc
ENV HOME /home/developer
RUN useradd --create-home --home-dir $HOME developer \
  && gpasswd -a developer developer \
  && chown -R developer:developer $HOME

RUN mkdir -p /home/developer/work && mkdir -p /home/developer/.vim/autoload
RUN curl 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' > $HOME/.vim/autoload/plug.vim
