import mysql.connector
from mysql.connector import Error
# They say that I'm redundant, and I say no...
import subprocess
import os
# OS for folder validation and management tasks, subprocess for commands!
from datetime import datetime

def create_connection():
    """Create database connection"""
    try:
        connection = mysql.connector.connect(
            unix_socket='/tmp/mysql.sock',
            database='MustelidSelector2000',
            user='Mylo'
        )
        if connection.is_connected():
            return connection
    except Error as e:
        print(f"Could not connect to the database D: - {e}")
        return None

def find_match(connection, traits):
    """Find the closest mustelid match based on provided trait values"""
    try:
        cursor = connection.cursor(dictionary=True)
        # Load the Mustelid Sorting script
        script_dir = os.path.dirname(os.path.abspath(__file__))
        sort_path = os.path.join(script_dir, "sort.sql")
        with open(sort_path, "r") as f:
            query = f.read()
            f.close()
        # Find our mustelid
        cursor.execute(query, (traits.get("biome"), traits.get("noodle"), traits.get("sillay"), traits.get("size"), traits.get("snoot")))
        result = cursor.fetchone()
        
        if result:
            return result['common_name']
        return "X( Could not find a matching mustelid, is the db populated?"
        
    except Error as e:
        print(f"X( Could not sort mustelids - {e}")

def show_all_mustelids():
    """Show all mustelids in the database"""
    try:
        # Tried to use a view, but it wasn't formatted nicely.
        query = "SELECT id AS '#', common_name AS 'COMMON NAME', scientific_name AS 'SCIENTIFIC NAME', genus AS 'GENUS' FROM Mustelids"
        # Run the query via the CLI for a prettier output
        subprocess.run(["mysql", "-u", "Mylo", "MustelidSelector2000", "-t", "-e", query])
    except Error as e:
        print(f"X( Could not fetch mustelids - {e}")

def check_exists(connection, id):
    """Check if a mustelid exists in the database by id"""
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT id FROM Mustelids WHERE id = %s", (id,))
        result = cursor.fetchone()
        return result
    except Error as e:
        print(f"X( Could not check for mustelid - {e}")

def backup_db():
    """Backup the database to a timestamped file"""
    try:
        # Timestamping backups before GTA 6?
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        backup_filename = f"backup_{timestamp}.sql"
        # Run mysqldump
        result = subprocess.run(["mysqldump", "-u", "Mylo", "MustelidSelector2000"], capture_output=True, text=True, check=True)
        # Make sure the backups dir exists relative to this script
        backups_dir = "DB/backups"
        os.makedirs(backups_dir, exist_ok=True)
        backup_path = os.path.join(backups_dir, backup_filename)
        try:    
            with open(backup_path, "w") as f:
                f.write(result.stdout)
            print("Backup Completed! :D")
            return True
        except Exception as e:
            print(f"X( Could not save the backup - {e}")
            return False
    except subprocess.CalledProcessError as e:
        print(f"X( Could not back up the DB - {e}")
        return False

def manage_backups():
    """Show all backups in the database"""
    try:
        # Try to locate the backups dir
        backups_dir = "DB/backups"
        if not os.path.exists(backups_dir):
            backups_dir = input("Weewooweewoo :3 - The backups directory couldn't be found automatically. Please enter the path to the backups dir.")
        # Get all backups
        backups = [f for f in os.listdir(backups_dir) if os.path.isfile(os.path.join(backups_dir, f))]
        backups.sort()
        for i, backup in enumerate(backups):
            date = backup.split("_")[1]
            date = f"{date[:4]}-{date[4:6]}-{date[6:]}"
            time = backup.split("_")[2].split(".")[0]
            time = f"{time[:2]}:{time[2:4]}:{time[4:]}"
            print(f"{i}: {date} - {time}")
        choice = input("Which backup would you like to restore?")
        if choice.isdigit() and int(choice) in range(len(backups)):
            if input("Weewooweewoo :3 - We're about to restore this backup, and this will make the current data non-recoverable. (Please type 'y' to continue or any other key to cancel)") == "y":
                # Package our path pedantically...
                backup_path = os.path.join(backups_dir, backups[int(choice)])
                with open(backup_path, "r") as f:
                    subprocess.run(["mysql", "-u", "Mylo", "MustelidSelector2000"], stdin=f, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                print("Backup restored! :D")
            else:
                print("Action cancelled :3")
        else:
            print("Huh? :3")
    except Exception as e:
        print(f"X( Could not show backups - {e}")

def delete_mustelid(connection, id):
    """Delete a mustelid from the database by id"""
    try:
        cursor = connection.cursor()
        
        # Load the script from delete.sql
        script_dir = os.path.dirname(os.path.abspath(__file__))
        delete_path = os.path.join(script_dir, "delete.sql")
        with open(delete_path, "r") as f:
            query = f.read()
            f.close()
        cursor.execute(query, (id,))

        connection.commit()
        backup_db()
        print("Mustelid deleted! :D")
    except Error as e:
        connection.rollback()
        print(f"X( Could not delete mustelid - {e}")

def import_data(connection):
    """Import mustelids from data.sql using the stored procedure"""
    try:
        # Locate data.sql relative to this script
        script_dir = os.path.dirname(os.path.abspath(__file__))
        data_path = os.path.join(script_dir, "data.sql")
        with open(data_path, "r") as f:
            sql_script = f.read()
            # Validate that the data looks sane.
            if sql_script.count(";") < 10:
                print("Data file looks incomplete D:")
                return "incomplete"
            else:
                print("Data file looks good :D")
            f.close()
        cursor = connection.cursor()
        # Load the stored procedure
        cursor.execute(sql_script)
        
        while cursor.nextset():
            pass
        
        # Call the procedure
        print("Executing stored procedure...")
        cursor.callproc('ImportMustelids')
        connection.commit()
        print("Imported Mustelids! :D")
        return True
    except Error as e:
        print(f"An error occured while importing D: - {e}")
        return False
