# User Manual: Automatic Environment Configuration in Windows

## Introduction

This manual describes the steps to execute a batch script called `COMANDO_USER_WINDOWS.bat`, which automates the configuration of a user environment in a Windows system. This script is responsible for creating a specific user, applying customization settings, and establishing security restrictions on the system.

## Objective

The objective of the `COMANDO_USER_WINDOWS.bat` script is to configure a standard user environment with predefined customization options, ensure that the system complies with organizational policies, and automate common tasks during login.

## Instructions

### 1. Preparation

- **Prerequisites:** Ensure that the operating system is Windows and that you have administrator access to run the script.
- **Required Files:** The `COMANDO_USER_WINDOWS.bat` file must be located in a folder with the following files and directories:
  - `autologin.reg`: Registry file that configures automatic login.
  - `ApplyTaskbarSettings.bat`: Script that adjusts the taskbar settings.
  - `ChangeBackground.bat`: Script that changes the desktop background.
  - `urs.jpg` or `urs.png`: Images to be used as the desktop background.
  - `ConfigLoginAplicationURS.exe`: Configuration application that will run at login.
- **Default Script Location:** The `COMANDO_USER_WINDOWS.bat` file is located by default at the following path: `C:\URS-KIOSK\CREATION_OF_USER\COMANDO_USER_WINDOWS.bat`.
  
![image](https://github.com/user-attachments/assets/241a28d2-c22a-4c9c-a34d-9ad4591a55e9)


### 2. Script Execution

- **Step 1:** Navigate to the folder where the `COMANDO_USER_WINDOWS.bat` file is located. If you have not moved it, the default path is `C:\URS-KIOSK\CREATION_OF_USER\COMANDO_USER_WINDOWS.bat`.
- **Step 2:** Right-click on the `COMANDO_USER_WINDOWS.bat` file and select "Run as administrator." This is crucial for the script to make all the necessary changes to the system.
  ![image](https://github.com/user-attachments/assets/b08323f7-c4ef-4445-b969-803438da3c60)
- **Step 3:** The script will start executing automatically. You will see messages in the console indicating the progress of each operation.
  ![image](https://github.com/user-attachments/assets/5080341e-2022-452b-a12b-4172ec8860e7)


### 3. What the Script Does

- **Create a user named `ursposuser`:** If the user already exists, no action will be taken. If not, it will be created and added to the Administrators group.
- **Configure automatic login:** The script will check if there is an existing automatic login configuration. If not, it will apply the configuration using a registry file (`autologin.reg`).
- **Apply taskbar and desktop background settings:** Scheduled tasks will be created to adjust the taskbar and change the desktop background during login.
  - **Note:** The `ApplyTaskbarSettings.bat` script is responsible for most of the changes and restrictions applied to Windows. These changes are primarily made through modifications in the system's Registry Editor, ensuring that the taskbar settings and other restrictions are applied consistently and securely.
- **Run specific applications at login:** The script configures the automatic execution of `ConfigLoginAplicationURS.exe` for the `ursposuser` user at login.
- **Restart the system:** Once all configurations have been applied, the system will automatically restart in 5 seconds.

## 4. Configuration and Use of ConfigLoginAplicationURS

### 4.1 Initial Configuration

When you first log in with the `ursposuser` user, the `ConfigLoginAplicationURS` application will check for previous configurations. If no saved configurations are found, a window will be presented to configure an initial option.
![image](https://github.com/user-attachments/assets/98dc2702-7697-4bab-bb5b-a0f0bf1fb86a)


### 4.2 Execution Mode Selection

1. **Web Page Mode:**
   - Select the Web Page option.
   - Enter the URL you want to open in kiosk mode.
   - Press Start, and the application will launch Microsoft Edge in kiosk mode and hide the taskbar.
   - The session will automatically close once the browser is closed.
     ![image](https://github.com/user-attachments/assets/88d317d3-2bd9-4c0d-8122-eb9692049f99)


2. **Desktop Program Mode:**
   - Select the Desktop Program option.
   - Browse and select the executable file of the program you want to run.
   - Press Start, and the program will launch, and the taskbar will be hidden.
   - The session will automatically close once the program finishes.
     ![image](https://github.com/user-attachments/assets/c0a56bf4-d811-4240-aa71-53826ce80be0)

3. **Orientation Selection:**
   -  After selecting the Web Page mode or Desktop Program mode, another window will appear where you can choose the screen orientation (horizontal or vertical). This choice will be made only once.
     ![image](https://github.com/user-attachments/assets/e1dc22a7-2ab0-4379-9d89-6be3e7b6baa2)


### 4.3 Saving Configurations

- The application automatically saves the last selected option (Web Page or Desktop Program) and will automatically execute it in future logins without manual intervention.

### 4.4 Resetting the Configuration

- If you wish to change the configuration after it has been saved, you can delete the stored values in the application settings. This can be done by deleting the folder located at the following path: `C:\Users\ursposuser\AppData\Local\ConfigLoginAplicationURS`.
- **Note:** The specific folder to delete will have a name like `ConfigLoginAplicationURS_Path`, followed by other characters that may vary. This operation must be performed from the administrator user where the script was initially run. Deleting this folder will reset the user's configuration based on the application.
  ![image](https://github.com/user-attachments/assets/22ebe6cb-51d9-48f5-95d8-f43634106cf4)


## 5. Troubleshooting

- **User creation error:** If the user already exists and you want to delete it to create a new one, you can do so manually from the user settings in Windows.
- **Issues with desktop background configuration:** Ensure that the background images (`urs.jpg` or `urs.png`) are present in the location specified in the script.
- **Insufficient permissions:** If the script does not execute correctly, ensure that you are running it as an administrator.
- **Error running the browser or program:**
  1. Verify that the URL or program path is correct.
  2. Ensure that Microsoft Edge is installed in the default location or adjust the path in the source code if necessary.

## Conclusion

By following this manual, you will be able to run the `COMANDO_USER_WINDOWS.bat` script to automatically configure a user environment in Windows with the necessary settings and restrictions. This process ensures that the system is prepared and optimized according to the specific needs of your work environment.
