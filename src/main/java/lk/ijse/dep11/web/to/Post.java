package lk.ijse.dep11.web.to;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Data @AllArgsConstructor @NoArgsConstructor
public class Post implements Serializable {
    private int postId;
    private int vehicleId;
    private String condition;
    private String mileage;
    private String description;
    private String sellerContact;
    private String location;
    private String postedTimestamp;
    private BigDecimal price;
    private List<String> imageList;
}
