package controller;

import bean.CategoriesBean;
import bean.ItemsBean;
import entity.Item;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet(loadOnStartup = 1, urlPatterns = {"/item", "/category"})
public class NavController extends HttpServlet {

    @EJB
    CategoriesBean categoriesBean;

    @EJB
    ItemsBean itemsBean;

    @Override
    public void init() {
        var ctx = getServletContext();
        ctx.setAttribute("categories", categoriesBean.findAll());
        ctx.setAttribute("allItems", itemsBean.findAll());
        ctx.setAttribute("catItems", null);
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String path = req.getServletPath();
        var ctx = getServletContext();
        ctx.setAttribute("catItems", null);
        if (Objects.equals(path, "/category")) {
            var param = req.getParameter("id");
            List<Item> items = null;
            if (param != null) {
                try {
                    var id = Long.parseLong(param);
                    var category = categoriesBean.findById(id);
                    if (category != null) {
                        items = itemsBean.findByCategory(category.getId());
                    }
                } catch (NumberFormatException ignored) {}
            }
            ctx.setAttribute("catItems", items);
            ctx.getRequestDispatcher("/index.jsp").forward(req, resp);
        } else if (Objects.equals(path, "/item")) {
            var param = req.getParameter("id");
            Item item = null;
            if (param != null) {
                try {
                    var id = Long.parseLong(param);
                    item = itemsBean.findById(id);
                } catch (NumberFormatException ignored) {}
            }
            ctx.setAttribute("item", item);
            ctx.getRequestDispatcher("/WEB-INF/views" + path + ".jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
}
