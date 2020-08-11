from sstruss/platformio as marlin

# Environment variables:
#
# MARLIN_BRANCH -- used by build.sh to get the specific branch

RUN apt update && apt install -y git wget zip

WORKDIR /marlin

# get the current branch
RUN git clone https://github.com/MarlinFirmware/Marlin.git /marlin

# get the configurations we care about
RUN wget https://github.com/MarlinFirmware/Configurations/archive/release-2.0.6.zip -P /tmp && \
    wget https://github.com/MarlinFirmware/Configurations/archive/bugfix-2.0.x.zip -P /tmp && \
    unzip /tmp/release-2.0.6.zip -d /tmp && \
    unzip /tmp/bugfix-2.0.x.zip -d /tmp

# update PIO platforms
RUN pio run --environment LPC1768 --target clean && pio update

ENV CACHEBUSTER=1

COPY src/update_configurations.sh /marlin
COPY src/build.sh /marlin
RUN chmod +x /marlin/update_configurations.sh /marlin/build.sh

CMD /marlin/build.sh

