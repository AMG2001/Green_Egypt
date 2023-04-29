import os

# Set the path of the folder containing the images
folder_path = r'C:\Users\mavic\Downloads\cans\cans\sprite'

# Get a list of all the image files in the folder
image_files = [f for f in os.listdir(folder_path) if f.endswith('.jpg') or f.endswith('.png') or f.endswith('.jfif')]

# Rename the images using the new names
for i, file_name in enumerate(image_files):
    # Construct the new file name
    file_ext = os.path.splitext(file_name)[1]  # get the file extension
    new_file_name = f'sprite{i}' + file_ext
    
    # Rename the file
    old_path = os.path.join(folder_path, file_name)
    new_path = os.path.join(folder_path, new_file_name)
    os.rename(old_path, new_path)