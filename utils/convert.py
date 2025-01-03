import cv2
import numpy as np

def create_rom(img_name, rom_name, width,height):

    img = cv2.imread(img_name)
    img = cv2.resize(img,(width,height))


    with open(rom_name,"w") as rom_file2:

        for i in range(0,height):
            for j in range(0,width):
                p = img[i][j]
                
                ihex = f"{p[0]//17:01X}{p[1]//17:01X}{p[2]//17:01X}"
                rom_file2.write(ihex)
                rom_file2.write("\n")
                
def create_maze_rom(img_name, rom_name):

    img = cv2.imread(img_name)


    with open(rom_name,"w") as rom_file2:

        for i in range(0,48):
            for j in range(0,48):
                ihex = "0"
                if i < 47 and j < 47:
                    p = img[i-1][j-1] if i > 0 and j > 0 else [0,0,0]
                    ihex = "0" if 0 in p else "1"
                rom_file2.write(ihex)
                rom_file2.write("\n")
                
def print_maze_rom(rom,width,height):
    
    img = np.zeros((height,width,3))
    
    with open(rom,"r") as rom_file:
    
        for i in range(0,height):
                for j in range(0,width):
                    l = rom_file.readline()
                    img[i][j] = [0,0,0] if "0" in l else [255,255,255]
                    
                    
    cv2.imwrite("main.jpg",img)

def print_rom(rom,width,height):
    
    img = np.zeros((height,width,3))
    
    with open(rom,"r") as rom_file:
    
        for i in range(0,height):
                for j in range(0,width):
                    l = rom_file.readline()
                    img[i][j] = [int(l[0],16)*17,int(l[1],16)*17,int(l[2],16)*17]
                    
                    
    cv2.imwrite("main.jpg",img)
                

create_rom("tile_temple.png","tile.mem",40,30)
# create_maze_rom("labirinto.png","labirinto.mem")
# print_maze_rom("labirinto.mem",48,48)
print_rom("tile.mem",40,30)