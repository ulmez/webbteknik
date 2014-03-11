package controllers;

import play.*;
import play.mvc.*;
import views.html.*;

public class Application extends Controller {

    public static Result startPageApplication() {
        return ok(start.render("This is my start page"));
    }

}
