package lk.ijse.dep11.web;

import lk.ijse.dep11.web.to.Post;
import lk.ijse.dep11.web.to.Vehicle;
import org.apache.commons.dbcp2.BasicDataSource;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@WebServlet({"/","/add"})
@MultipartConfig(location = "/tmp")
public class PostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BasicDataSource pool = (BasicDataSource) getServletContext().getAttribute("connectionPool");
        try (Connection connection = pool.getConnection()){
            Statement stmPost = connection.createStatement();
            ResultSet rstPost = stmPost.executeQuery("SELECT * FROM post");

            PreparedStatement imageStm = connection.prepareStatement("SELECT * FROM post_image WHERE post_id = ?");

            List<Post> postList = new ArrayList<>();
            while(rstPost.next()) {
                int postId = rstPost.getInt("post_id");
                int vehicleId = rstPost.getInt("vehicle_id");
                String condition = rstPost.getString("condition");
                String mileage = rstPost.getString("mileage");
                String description = rstPost.getString("description");
                String sellerContact = rstPost.getString("seller_contact");
                String location = rstPost.getString("location");
                String postedTimestamp = rstPost.getString("posted_timestamp");
                String district = rstPost.getString("district");
                BigDecimal price = rstPost.getBigDecimal("price");

                imageStm.setInt(1, postId);
                ResultSet rstImages = imageStm.executeQuery();

                List<String> imageList = new ArrayList<>();
                while (rstImages.next()) {
                    imageList.add(rstImages.getString("image"));
                }

                postList.add(new Post(postId, vehicleId, condition, mileage, description, sellerContact, location, postedTimestamp, district, price, imageList));
            }

            Statement stmVehicle = connection.createStatement();
            ResultSet rstVehicle = stmVehicle.executeQuery("SELECT * FROM vehicle");

            List<Vehicle> vehicleList = new ArrayList<>();
            while(rstVehicle.next()) {
                int vehicleId = rstVehicle.getInt("vehicle_id");
                String brand = rstVehicle.getString("brand");
                String model = rstVehicle.getString("model");
                String yom = rstVehicle.getString("yom");
                String engineCapacity = rstVehicle.getString("engine_capacity");
                String fuelType = rstVehicle.getString("fuel_type");

                vehicleList.add(new Vehicle(vehicleId, brand, model, yom, engineCapacity, fuelType));
            }
            req.setAttribute("postList", postList);
            req.setAttribute("vehicleList", vehicleList);

            getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String brand = req.getParameter("brand");
        String model = req.getParameter("model");
        String yom = req.getParameter("yom");
        String capacity = req.getParameter("capacity");
        String fuelType = req.getParameter("fuel");
        String condition = req.getParameter("condition");
        String mileage = req.getParameter("mileage");
        String contact = req.getParameter("contact");
        String location = req.getParameter("location");
        String district = req.getParameter("district");
        String price = req.getParameter("price");
        String description = req.getParameter("description");
//        Part picture = req.getPart("picture");

//        if(picture.getSize() > 0) {
//            String uploadDirPath = getServletContext().getRealPath("/uploads");
//            UUID imageId = UUID.randomUUID();
//            picture.write(uploadDirPath + imageId);
//        }

        BasicDataSource pool = (BasicDataSource) getServletContext().getAttribute("connectionPool");
        try {
            Connection connection = pool.getConnection();
            connection.setAutoCommit(false);
            try {
                PreparedStatement stmVehicle = connection.prepareStatement("INSERT INTO vehicle (brand, model, yom, engine_capacity, fuel_type) VALUES (?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);

                stmVehicle.setString(1, brand);
                stmVehicle.setString(2, model);
                stmVehicle.setString(3, yom);
                stmVehicle.setString(4, capacity);
                stmVehicle.setString(5, fuelType);

                stmVehicle.executeUpdate();
                ResultSet generatedKeys = stmVehicle.getGeneratedKeys();

                generatedKeys.next();
                PreparedStatement stmPost = connection.prepareStatement("INSERT INTO post (vehicle_id, `condition`, mileage, description, seller_contact, location, posted_timestamp, district, price) VALUES (?,?,?,?,?,?,?,?,?)");

                stmPost.setInt(1, generatedKeys.getInt(1));
                stmPost.setString(2, condition);
                stmPost.setString(3, mileage);
                stmPost.setString(4, description);
                stmPost.setString(5, contact);
                stmPost.setString(6, location);
                stmPost.setString(7, String.valueOf(LocalDateTime.now()));
                stmPost.setString(8, district);
                stmPost.setString(9, price);

                stmPost.executeUpdate();

//                stmStudent.executeUpdate();

//                if (picture.getSize() > 0) {
//                    String uploadDirPath = getServletContext().getRealPath("/uploads/");
//                    UUID imageId = UUID.randomUUID();
//                    String picturePath = uploadDirPath + imageId;
//                    ResultSet generatedKeys = stmStudent.getGeneratedKeys();
//                    generatedKeys.next();
//
//                    PreparedStatement stmPicture = connection.prepareStatement("INSERT INTO picture (student_id, path) VALUES (?, ?)");
//                    stmPicture.setInt(1,generatedKeys.getInt(1));
//                    stmPicture.setString(2,"uploads/" + imageId);
//                    stmPicture.executeUpdate();
//
//                    picture.write(picturePath);
//                }
                connection.commit();
            } catch (Throwable t) {
                connection.rollback();
                t.printStackTrace();
            } finally {
                connection.setAutoCommit(true);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect("/app");
    }
}
