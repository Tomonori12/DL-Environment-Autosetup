## DL-Environment-Autosetup
This repository includes this readme and Makefile.  The Makefile allows you to easily setup a deep learning platform using keras, tensorflow and theano.  The testing environmnet is X79 Extream 9 with Core i7, 32Gb memory and GTX Titan Black.  All processes can be done just to follow Makefile code as below, expect for cuDNN download.  You need to download cuDNN library manually.  Be sure to have cuDNN (cuDNN v5.1 Runtime Library for Ubuntu 14.04 (Deb)), and it requires a registration step before you download.  Visit -> https://developer.nvidia.com/cudnn


### 1. Download and make a directory to keep Makefile.  Let's assume that we keep it in "DL_folder" under your user accuount folder.

  - This Makefile code uses a relative path.  So, YOU MAST KEEP THE MAKEFILE IN A FOLDER UNDER YOUR USER ACCOUNT. 

### 2. Get "cuDNN v5.1 Runtime Library for Ubuntu 14.04 (Deb)" and put it in the "DL_foloder"

### 3. Open terminal and move to "DL_folder". E.g. ```cd ./DL_folder```

### 4. Type ```sudo make basic``` in terminal.

  - This will get g++ and git libraries.  If you have these, instalations will be skipped.

### 5. Type ```sudo make blacklist``` in termianl.

  - This will stpo nouveau display driver, which is originally used in Ubuntu, but cannot run deep learning.
  
### 6. Type ```make texton``` in terminal.

  - This will force you to reboot as CUI mode to install a nvidia original display driver.
  
  
### 7. Now you're in CUI mode, right?  Try to login your account.

  - Only text massage will appear on the screen.

### 8. Move to "DL_folder" and type ```make cudainstall``` in CUI.

  - It will sometime to download and install cuda.  Cuda is about 1.4Gb, so be patient.
  - *Just before the instalation process starts, you need to type in your superuser password.*
  - To install cuda, you need to follow the screen guides and basically type in as below:
    -   accept   >   ```Enter```   >   y   >   y   >   y   ...            *[not exactly sure, but select "yes" for all questions]*

### 9. Type ```make cudaecho``` soon after you install cuda.

  - This is to configure the path for cuda.

### 10. Type ```make textoff``` to return GUI mode.

  - Now the computer starts rebooting.
  
### 11. Open terminal and move to "DL_folder" again.

### 12. Type ```sudo make cudnn``` in terminal.

  - This will install cuDNN library.  Again, make sure you have "cuDNN v5.1 Runtime Library for Ubuntu 14.04 (Deb)" in "DL_folder"

### 13. Type ```make anainstall``` in terminal

  - This step is to download and install Anaconda.  Anaconda is 0.5Mb.
  - To install anaconda, you need to follow guides.
  - If you don't mind, better select ```yes``` to set a path to Anaconda's python.

### 14. Type ```make pip``` in terminal.

  - Now you install all required packages for deep learning.


### 15. Type ```make git``` in terminal.

  - Now you can test your platform. E.g. ```python ../keras/example/mnist_cnn.py```


