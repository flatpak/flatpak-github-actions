using Gtk;

class App : Gtk.Application {

    public App () {
        Object (
#if DEVEL
            application_id: "org.example.MyApp.Devel",
#else
            application_id: "org.example.MyApp",
#endif
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    static int main (string[] args) {
        var app = new App ();
        return app.run (args);
    }

    protected override void activate () {
        var win = this.active_window;

        if (win == null) {
            win = new ApplicationWindow (this);
            win.show_all ();
        }

        win.present ();
    }
}
