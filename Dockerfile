# Use an Ubuntu base image with the latest version of Miniconda pre-installed
FROM conda/miniconda3:latest

# Set the working directory to /home/jovyan (the default Jupyter user)
WORKDIR /home/jovyan

# Copy the environment.yml file from the repository into the container
COPY environment.yml .

# Create a new conda environment from the environment.yml file
RUN conda env create -f environment.yml

# Activate the new conda environment
RUN echo "source activate fenicsx" > ~/.bashrc

# Install any additional dependencies using apt-get
USER root
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Copy the postBuild script from the repository into the container
COPY postBuild .

# Run the postBuild script
RUN ./postBuild

# Set the default user back to jovyan
USER jovyan
