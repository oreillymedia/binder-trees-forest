FROM jupyter/scipy-notebook:c7fb6660d096

# launchbot-specific labels
LABEL name.launchbot.io="Machine Learning"
LABEL workdir.launchbot.io="/home/jovyan"
LABEL description.launchbot.io="Machine Learning"
LABEL 8888.port.launchbot.io="Jupyter Notebook"

# Needed for seaborn import in download_data.py
USER root
COPY requirements.txt . 
RUN pip install -r requirements.txt 
USER $NB_USER

# Set the working directory
WORKDIR /home/jovyan

# Add files
COPY download_data.py download_data.py
RUN python /home/jovyan/download_data.py
COPY *.ipynb /home/jovyan/
COPY lesson*.py /home/jovyan/
COPY images /home/jovyan/images

USER root
RUN chown $NB_USER:users /home/$NB_USER/*
USER $NB_USER


# Expose the notebook port
EXPOSE 8888

# Start the notebook server
CMD jupyter notebook --no-browser --port 8888 --ip=* --NotebookApp.token='' --NotebookApp.disable_check_xsrf=True

