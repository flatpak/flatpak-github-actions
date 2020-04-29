#include <gtk/gtk.h>

void activate (GApplication* app) {
    GtkWindow* win = gtk_application_get_active_window ((GtkApplication*) app);

    if (win == NULL) {
        win = (GtkWindow*) gtk_application_window_new ((GtkApplication*) app);
        gtk_widget_show_all ((GtkWidget*) win);
    }

    gtk_window_present (win);
}

int main (int argc, char** argv) {
    GtkApplication* app;

    app = gtk_application_new (
#ifdef DEVEL
        "org.example.MyApp.Devel",
#else
        "org.example.MyApp",
#endif
        G_APPLICATION_FLAGS_NONE
    );

    g_signal_connect (app, "activate", (GCallback) activate, NULL);

    return g_application_run ((GApplication*) app, argc, argv);
}
