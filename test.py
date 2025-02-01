# test_script.py
import os
import sys

def main():
    print("Python script is running!")
    print(f"Python version: {sys.version}")
    print(f"Current working directory: {os.getcwd()}")

    # Create a test file to verify the script is working
    test_file_path = "test_file.txt"
    with open(test_file_path, "w") as f:
        f.write("This file was created by the Python script!")

    print(f"Created a test file at: {test_file_path}")

    # Check if the script is running as admin
    try:
        with open("C:\\Windows\\System32\\test_admin.txt", "w") as f:
            f.write("This file was created by the Python script with admin privileges!")
        print("Script is running with admin privileges.")
    except PermissionError:
        print("Script is NOT running with admin privileges.")

    input("Press Enter to exit...")

if __name__ == "__main__":
    main()