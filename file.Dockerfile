// write a new docker file

FROM baseImage
RUN command
EXPOSE port
ADD source dest
CMD [ "executable" ]    
ENTRYPOINT [ "executable" ]
