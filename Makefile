#Time-stamp: <2017-March-23>

OUTDIR_KERAS = ../keras
#INSDIR_KERAS = ./keras

message:
	echo "specify what you want to do"

basic:
	sudo apt-get update
	sudo apt-get install -y g++
	sudo apt-get install -y git

blacklist:
	echo ""                           > test.txt
	echo "blacklist nouveau"          >> test.txt
	echo "blacklist lbm-nouveau"      >> test.txt
	echo "options nouveau modeset=0"  >> test.txt
	echo "alias nouveau off"          >> test.txt
	echo "alias lbm-nouveau off"      >> test.txt
	sudo mv test.txt /etc/modprobe.d/blacklist-nouveau.conf
	echo ""                           > test2.txt
	echo "options nouveau modeset=0"  >> test2.txt
	sudo mv test2.txt /etc/modprobe.d/nouveau-kms.conf
	sudo update-initramfs -u

texton:
	sudo grep -l 'splash' /etc/default/grub | sudo xargs sed -i.bak -e 's/splash/splash text/g'
	sudo update-grub
	sudo reboot


cuda8.0: cuda8.0echo
	wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
	sudo sh cuda_8.0.61_375.26_linux-run

cuda8.0echo:
	echo ""                                                                     >> ~/.bashrc
	echo ""                                                                     >> ~/.bashrc
	echo ""                                                                     >> ~/.bashrc
	echo "#----------------------------------------------------------"          >> ~/.bashrc
	echo "# Added by Tomonori12 DL-Environment-Autosetup"                       >> ~/.bashrc
	echo "#----------------------------------------------------------"          >> ~/.bashrc
	echo "export PATH=/usr/local/cuda-8.0/bin:\$$PATH"                          >> ~/.bashrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:\$$LD_LIBRARY_PATH"   >> ~/.bashrc


cuda7.5: cuda7.5echo
	wget http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run
	sudo sh cuda_7.5.18_linux.run

cuda7.5echo:
	echo ""                                                                     >> ~/.bashrc
	echo ""                                                                     >> ~/.bashrc
	echo ""                                                                     >> ~/.bashrc
	echo "#----------------------------------------------------------"          >> ~/.bashrc
	echo "# Added by Tomonori12 DL-Environment-Autosetup"                       >> ~/.bashrc
	echo "#----------------------------------------------------------"          >> ~/.bashrc
	echo "export PATH=/usr/local/cuda-7.5/bin:\$$PATH"                          >> ~/.bashrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda-7.5/lib64:\$$LD_LIBRARY_PATH"   >> ~/.bashrc


textoff:
	sudo grep -l 'splash text' /etc/default/grub | sudo xargs sed -i.bak -e 's/splash text/splash/g'
	sudo update-grub
	sudo reboot

cudnn5.1cuda8.0:
	wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/libcudnn5_5.1.10-1+cuda8.0_amd64.deb
	sudo dpkg -i libcudnn5_5.1.10-1+cuda8.0_amd64.deb

cuda5.1cuda7.5:
	wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/libcudnn5_5.1.10-1+cuda7.5_amd64.deb
	sudo dpkg -i libcudnn5_5.1.10-1+cuda7.5_amd64.deb

anainstall:
	wget https://repo.continuum.io/archive/Anaconda3-4.3.0-Linux-x86_64.sh
	bash ./Anaconda3-4.3.0-Linux-x86_64.sh
	sudo reboot

pip:
	pip install keras
	pip install tensorflow
	pip install tensorflow-gpu


opencv:
	conda install -c https://conda.binstar.org/menpo opencv3

git:
	git clone https://github.com/fchollet/keras $(OUTDIR_KERAS)

clean:
	rm -rf *~ .*~
