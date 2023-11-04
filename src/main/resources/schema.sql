CREATE TABLE IF NOT EXIST vehicle(
    vehicle_id INT PRIMARY KEY AUTO INCREMENT,
    brand VARCHAR(10) NOT NULL ,
    model VARCHAR(15) NOT NULL,
    yom VARCHAR(10) NOT NULL,
    engine_capacity VARCHAR(10) NOT NULL,
    fuel_type VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXIST post(
    post_id INT PRIMARY KEY AUTO INCREMENT,
    vehicle_id INT NOT NULL ,
    condition VARCHAR(10) NOT NULL,
    mileage VARCHAR(20) NOT NULL,
    description VARCHAR(300) NOT NULL,
    seller_contact VARCHAR(15) NOT NULL,
    location VARCHAR(20) NOT NULL,
    posted_timstamp VARCHAR(20) NOT NULL,
    district VARCHAR(20) NOT NULL,
    price BIG DECIMAL NOT NULL,

    CONSTRAINT fk_vehicle FOREIGN KEY vehicle_id REFERENCES vehicle(vehicle_id) ON CASCADE DELETE
);

CREATE TABLE IF NOT EXIST post_image(
    post_id INT PRIMARY KEY ,
    image VARCHAR(100) NOT NULL ,

    CONSTRAINT fk_post FOREIGN KEY post_id REFERENCES post(post_id) ON CASCADE DELETE
);