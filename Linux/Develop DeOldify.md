# --------------------------------------------------------------------------------------------------
# DeOldify
# https://github.com/jantic/DeOldify
# --------------------------------------------------------------------------------------------------
git clone https://github.com/jantic/DeOldify.git
cd DeOldify
conda env create -f environment.yml
# Then start running with these commands:
source activate deoldify
jupyter lab
# http://localhost:8888/lab
conda install -c conda-forge jupyterlab
conda install -c anaconda tensorflow-gpu
# Pretrained Weights
# https://www.dropbox.com/s/7r2wu0af6okv280/colorize_gen_192.h5
# Then open the ColorizeVisualization.ipynb in Jupyter Lab
# https://github.com/jantic/DeOldify/blob/master/ColorizeVisualization.ipynb
# Colorizing Your Own Photos
# vis.plot_transformed_image("test_images/old-moscow-photos.jpg")
# vis.plot_transformed_image("test_images/Chief.jpg", render_factor=17)
# --------------------------------------------------------------------------------------------------

