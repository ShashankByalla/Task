FROM ubuntu:18.04
RUN apt-get update -y
RUN apt install fortune-mod cowsay -y
COPY wisecow.sh /wisecow.sh
EXPOSE 4499
CMD ["wisecow.sh"]
