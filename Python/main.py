import utils

i = 1
while i <= 12:
    m = (str(i), "0"+str(i))[i<10]
    utils.delete(r"/2017/"+m+"/")
    # source_folder = r"/2017/"+m+"/"
    # destination_folder = r"/2017/"
    # move_all_files(source_folder, destination_folder)
    i += 1
