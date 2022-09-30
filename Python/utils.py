import glob
import os
import os.path
from os import path
import shutil

def move_all_files(source_folder, destination_folder):
    # fetch all files
    for file_name in os.listdir(source_folder):
        # construct full file path
        source = source_folder + file_name
        destination = destination_folder + file_name
        # move only files
        if os.path.isfile(source):
            shutil.move(source, destination)
            print('Moved:', file_name)

def move_files_with_pattern(source_folder, destination_folder, pattern):
    files = glob.glob(source_folder + pattern)
    for file in files:
        # extract file name form file path
        file_name = os.path.basename(file)
        shutil.move(file, destination_folder + file_name)
        print('Moved:', file)

def rename(source, destination):
    os.rename(source, destination)
    print('Renamed:', source+" => "+destination)

def delete(source):
    if path.isfile(source):
        os.remove(source)
    else:
        os.rmdir(source)
    print('Deleted:', source)

def mkdir(path):
    os.mkdir(path)
    print('Directory created:', path)