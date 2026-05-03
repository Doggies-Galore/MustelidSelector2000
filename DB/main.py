import database as db
import random
import textual_slider
from textual.app import App
from textual.widgets import Button, Static
from textual.containers import Horizontal, Vertical, VerticalScroll

# Textual UX for our sliders
class SliderApp(App):
    # Setup our db connector
    def __init__(self, connection):
        super().__init__()
        self.connection = connection

    def compose(self):
        with Horizontal():
            # Main interactive UX on the left
            with VerticalScroll():
                yield Static("MustelidSelector2000 - TUI!")
                yield Static("Arid - Aquatic")
                yield textual_slider.Slider(1, 5, step=0.5, id="biome")
                yield Static("Dog - Noodle")
                yield textual_slider.Slider(1, 5, step=0.5, id="noodle")
                yield Static("Serious - Sillay")
                yield textual_slider.Slider(1, 5, step=0.5, id="sillay")
                yield Static("Smol - Big")
                yield textual_slider.Slider(1, 5, step=0.5, id="size")
                yield Static("Snot - Snooooot")
                yield textual_slider.Slider(1, 5, step=0.5, id="snoot")
            # Buttons and results on the right
            with Vertical():
                yield Static("Best Match:", id="label")
                yield Static("---", id="result-display")
                with Horizontal():
                    yield Button("Reveal Mustelid", id="reveal")
                    yield Button("Random", id="random")
        yield Static("\nPress ESC to exit")

    def on_button_pressed(self, event: Button.Pressed) -> None:
        if event.button.id == "random":
            # Mix em up!
            for slider in self.query("Slider"):
                slider.value = random.uniform(1.0, 5.0)
        elif event.button.id == "reveal":
            # Get slider values and kickoff the sort
            traits = {s.id: s.value for s in self.query("Slider")}
            best_match = db.find_match(self.connection, traits)
            # Show results!
            self.query_one("#result-display", Static).update(best_match)
    # So users can be let out :3
    def on_key(self, event):
        if event.key == "escape":
            self.exit()

def main():
    print("Mustelid Selector 2000 Database Manager")
    print("=" * 40)
    
    connection = db.create_connection()
    if not connection:
        return
    
    while True:
        print("MENU " + "=" * 35)
        print("1. Import Mustelids")
        print("2. View all Mustelids")
        print("3. Query Mustelids with sliders...")
        print("4. Delete Mustelids from db...")
        print("5. Restore the DB from a backup...")
        print("6. Exit")
        
        choice = input("\nChoice: ")
        
        if choice == "1":
            print("Backing up first...")
            if not db.backup_db():
                if input("Weewooweewoo :3 - The existing database could not be backed up! Are you sure you want to nuke it's contents and pack it with mustelids? (Please type 'y' to continue or any other key to cancel)") != "y":
                    continue
            
            print("Importing Mustelids...")
            res = db.import_data(connection)
            if res == "incomplete":
                if input("Weewooweewoo :3 - Our Mustelids look incomplete! Are you sure you want to continue? (Please type 'y' to continue or any other key to cancel)") != "y":
                    continue
                # If they want to continue despite incompleteness, they can try manually or we can provide a force flag.
        
        elif choice == "2":
            db.show_all_mustelids()
        elif choice == "3":
            # Start textual UX
            app = SliderApp(connection)
            app.run()
        elif choice == "4":
            # First, show the user a list of mustelids and allow them to select one for deletion.
            db.show_all_mustelids()
            to_delete = input("Which mustelid would you like to delete?")
            if to_delete.isdigit():
                # Validate that the mustelid exists
                if db.check_exists(connection, to_delete):
                    if input("Weewooweewoo :3 - We're about to delete this mustelid, and this will make the current data non-recoverable. (Please type 'y' to continue or any other key to cancel)") == "y":
                        # Delete the mustelid
                        db.delete_mustelid(connection, int(to_delete))
                        print("Poof!")
                    else:
                        print("Action cancelled :3")
                else:
                    print("That mustelid doesn't exist :3")
            else:
                print("Huh? :3")
        elif choice == "5":
            db.manage_backups()
        elif choice == "6":
            cya=["Adiós!", "See you!", "Bye now!", "じゃあね！"]
            print(random.choice(cya))
            break
    
    connection.close()

if __name__ == "__main__":
    main()
