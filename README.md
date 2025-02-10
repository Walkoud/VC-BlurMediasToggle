# BlurMedias
Vencord plugin to blur all medias, unblur when poiting the mouse

![qeAOy72nXV](https://github.com/user-attachments/assets/9edef370-858c-4500-91cf-1f0c84cf36ca)
![Discord_rg4d71Q76G](https://github.com/user-attachments/assets/a909d72d-0439-4c30-b3fd-78f0bbc165a8)

![image](https://github.com/user-attachments/assets/f6dbda9d-43ba-4785-94ff-e6e52a501100)

# How to Install Vencord with BlurMediasToggle

## Install auto ✅ with Windows & Linux :

https://github.com/Walkoud/VC-BlurMediasToggle/releases/tag/installation

## Install manualy : 

## Prerequisites
Before you begin, make sure you have the following installed on your system:
- [Node.js](https://nodejs.org/) (Latest LTS recommended)
- [Git](https://git-scm.com/)
- [pnpm](https://pnpm.io/installation)

### Install pnpm (if not already installed)
```sh
npm install -g pnpm@latest-10
```

## Installation Steps

### 1. Clone the Repository
Open a terminal and run the following command to clone the Vencord repository:
```sh
git clone https://github.com/Vendicated/Vencord
cd Vencord
```

### 2. Install Dependencies
Run the following command to install the required dependencies:
```sh
pnpm install --frozen-lockfile
```

### 3. Create User Plugin Directory
Navigate to the `src` directory inside `Vencord` and create a folder named `userplugins`:
```sh
mkdir -p Vencord/src/userplugins/BlurMediasToggle
```

### 4. Add the Plugin File
Download `index.tsx` and place it inside the `BlurMediasToggle` folder.

### 5. Build and Inject Vencord
Run the following commands to build and inject Vencord:
```sh
pnpm build
pnpm inject
```

### 6. Select Stable Version
Use the arrow keys to select `Stable` and press `Enter`.

### 🎉 Done! 
Vencord is now installed with the BlurMediasToggle plugin!

