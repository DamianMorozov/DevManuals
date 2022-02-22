# --------------------------------------------------------------------------------------------------
# CUDA Toolkit 10.1 Download
# https://www.pugetsystems.com/labs/hpc/How-to-install-CUDA-9-2-on-Ubuntu-18-04-1184/#step-2-get-the-right-nvidia-driver-installed
# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1804&target_type=debnetwork
--------------------------------------------------------------------------------------------------
sudo dpkg -i cuda-repo-ubuntu1804_10.1.105-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda
# --------------------------------------------------------------------------------------------------

