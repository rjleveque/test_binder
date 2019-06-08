
FROM clawpack/v5.6.0_dockerimage:release
# this dockerhub image has a user jovyan and clawpack installed 
# in /home/jovyan/clawpack-v5.6.0


ENV NB_USER jovyan
User jovyan

WORKDIR ${HOME}


# Install notebook extensions
#RUN pip install --user --no-cache-dir \
    #jupyter \
    #jupyter_contrib_nbextensions \
    #jupyterhub-legacy-py2-singleuser==0.7.2

RUN git clone https://github.com/ipython-contrib/jupyter_contrib_nbextensions.git
RUN pip install --user -e jupyter_contrib_nbextensions

ENV PATH ${PATH}:/home/jovyan/.local/bin
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable widgetsnbextension --py
RUN jupyter nbextension enable equation-numbering/main

# Start notebook server
CMD jupyter notebook --ip='*' --no-browser
