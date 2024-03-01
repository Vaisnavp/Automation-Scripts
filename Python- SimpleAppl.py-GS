import subprocess
import tkinter as tk
from tkinter import messagebox

class SimpleApp:
    def __init__(self, master):
        self.master = master
        self.master.title("Simple Application")
        
        self.status_label = tk.Label(master, text="Application is stopped", fg="red")
        self.status_label.pack()

        self.start_button = tk.Button(master, text="Start Application", command=self.start_application)
        self.start_button.pack()

        self.stop_button = tk.Button(master, text="Stop Application", command=self.stop_application)
        self.stop_button.pack()

        self.status_button = tk.Button(master, text="Check Status", command=self.check_status)
        self.status_button.pack()

        self.running = False

    def start_application(self):
        # Logic to start the application
        if not self.running:
            try:
                # Execute the script remotely using SSH
                command = 'ssh administrator@10.0.6.55 "/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/Script/start.sh"'
                subprocess.run(command, shell=True, check=True)
                
                print("Application started successfully.")
                self.running = True
                self.status_label.config(text="Application is running", fg="green")
                messagebox.showinfo("Success", "Application started successfully.")
            except subprocess.CalledProcessError as e:
                print("Error occurred while starting application:", e)
                messagebox.showerror("Error", f"Error occurred while starting application: {e}")
        else:
            messagebox.showwarning("Warning", "Application is already running!")

    def stop_application(self):
        # Logic to stop the application
        pass

    def check_status(self):
        # Logic to check the status of the application
        pass

def main():
    root = tk.Tk()
    app = SimpleApp(root)
    root.mainloop()

if __name__ == "__main__":
    main()
