FROM kasmweb/debian-bookworm-desktop:1.14.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME
######### Customize Container Here ###########


RUN apt-get --purge remove signal-desktop -y
RUN apt-get --purge remove thunderbird -y
RUN apt-get --purge remove obs-* -y
RUN apt-get --purge remove vlc* -y
RUN apt-get --purge remove telegram-desktop -y
RUN wget -q https://github.com/PowerShell/PowerShell/releases/download/v7.3.7/powershell_7.3.7-1.deb_amd64.deb
RUN dpkg -i powershell_7.3.7-1.deb_amd64.deb
RUN apt-get install -f
RUN rm powershell_7.3.7-1.deb_amd64.deb

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
