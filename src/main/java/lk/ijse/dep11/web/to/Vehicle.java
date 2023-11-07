package lk.ijse.dep11.web.to;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
@Data @NoArgsConstructor @AllArgsConstructor
public class Vehicle implements Serializable {
    private int vehicleId;
    private String brand;
    private String model;
    private String yom;
    private String engineCapacity;
    private String fuelType;
}
