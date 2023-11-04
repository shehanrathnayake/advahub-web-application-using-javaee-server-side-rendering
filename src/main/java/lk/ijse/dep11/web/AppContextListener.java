package lk.ijse.dep11.web;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import java.io.File;
import java.sql.SQLException;

@WebListener
public class AppContextListener implements ServletContextListener {

    BasicDataSource pool;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String appPath = sce.getServletContext().getRealPath("/");
        new File(appPath, "uploads").mkdir();

        pool = new BasicDataSource();
        pool.setUrl("jdbc:mysql://localhost:3306/advahub_web_app");
        pool.setUsername("root");
        pool.setPassword("1234");
        pool. setDriverClassName("com.mysql.cj.jdbc.Driver");
        pool.setInitialSize(5);
        pool.setMaxTotal(15);
        sce.getServletContext().setAttribute("connectionPool", pool);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            pool.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
