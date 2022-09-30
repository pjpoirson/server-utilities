import utils
import os.path
from os import path

# Create month / year folders and move files
# year = "2022"
# m = 1
# while m <= 12:
#     month = (str(m), "0"+str(m))[m<10]
#     source_folder = r"/home/"+year+"/"
#     destination_folder = r"/home/"+year+"/"+year+month+"/"
#     if not path.exists(destination_folder):
#         utils.mkdir(destination_folder)
#     if (path.exists(source_folder)):
#         utils.move_files_with_pattern(source_folder, destination_folder, "*"+year+month+"*.pdf")
#     m += 1

# Browse month and day folders
# Move files and delete old directory
# m = 1
# while m <= 12:
#     d = 1
#     month = (str(m), "0"+str(m))[m<10]
#     while d <= 31:
#         day = (str(d), "0"+str(d))[d<10]
#         source_folder = r"/home/2017/2017"+month+"/factures-2017"+month+day+"/"
#         destination_folder = r"/home/2017/2017"+month+"/"
#         if path.exists(source_folder):
#             utils.move_all_files(source_folder, destination_folder)
#             utils.delete(source_folder)
#         d += 1
#     m += 1