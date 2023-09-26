FROM kasmweb/debian-bookworm-desktop:1.14.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME
######### Customize Container Here ###########

#Need to clean up desktop icons
RUN apt-get --purge remove signal-desktop -y
    && apt-get --purge remove thunderbird -y
    && apt-get --purge remove obs-* -y
    && apt-get --purge remove vlc* -y

#Prob should use the repo. but meh.
RUN wget -q https://github.com/PowerShell/PowerShell/releases/download/v7.3.7/powershell_7.3.7-1.deb_amd64.deb
    && dpkg -i powershell_7.3.7-1.deb_amd64.deb
    && apt-get install -f
    && rm powershell_7.3.7-1.deb_amd64.deb

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
