
FROM clawpack/v5.6.0_dockerimage:release

# this dockerhub image has a user jovyan and clawpack installed 
# in /home/jovyan/clawpack-v5.6.0

RUN git clone https://github.com/rjleveque/test_binder

# Install other things if you want
