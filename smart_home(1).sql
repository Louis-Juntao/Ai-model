CREATE DATABASE smart_home;
USE smart_home;

-- 创建device表
CREATE TABLE `Devices` (
    device_id INT PRIMARY KEY AUTO_INCREMENT,
    device_name VARCHAR(100),
    device_type VARCHAR(50),
    status VARCHAR(20),
    install_date DATETIME,
    room_id INT,
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);
ALTER TABLE Devices DROP FOREIGN KEY room_id;

ALTER TABLE Devices 
    ADD COLUMN home_id INT AFTER device_id,
     DROP COLUMN device_name;
ALTER TABLE Devices 
    DROP COLUMN install_date;
    
ALTER TABLE Devices 
    ADD CONSTRAINT fk_home_id FOREIGN KEY (home_id) REFERENCES Home(id),
    ADD CONSTRAINT fk_room_id_bedroom FOREIGN KEY (room_id) REFERENCES Bedroom(room_id)
    ON DELETE SET NULL;

DESC `Users`;



-- 创建user表
CREATE TABLE `Users` (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    password VARCHAR(100),  
    email VARCHAR(100),
    phone VARCHAR(15),
    role VARCHAR(50)
);

-- 创建room表
CREATE TABLE `Rooms` (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(100),
    location VARCHAR(100)
);

-- 创建Devicelog表
CREATE TABLE DeviceLogs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    device_id INT,
    status VARCHAR(20),
    operation_time DATETIME,
    user_id INT,
    message VARCHAR(255),
    FOREIGN KEY (device_id) REFERENCES Devices(device_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- 创建DeviceUserMapping表
CREATE TABLE DeviceUserMapping (
    mapping_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    device_id INT,
    permission VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (device_id) REFERENCES Devices(device_id)
);

-- 创建 Home 表
CREATE TABLE Home (
    id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    zip VARCHAR(10),
    bedroom_1 INT,
    bedroom_2 INT,
    living_room INT,
    kitchen INT,
    bathroom_1 INT,
    bathroom_2 INT
);

-- 创建 Bedroom 表
CREATE TABLE Bedroom (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    home_id INT,
    device_id_1 INT,
    device_id_2 INT,
    device_id_3 INT,
    device_id_4 INT,
    device_id_5 INT,
    FOREIGN KEY (home_id) REFERENCES Home(id)
);

-- 创建 Living Room 表
CREATE TABLE LivingRoom (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    home_id INT,
    device_id_1 INT,
    device_id_2 INT,
    device_id_3 INT,
    device_id_4 INT,
    device_id_5 INT,
    FOREIGN KEY (home_id) REFERENCES Home(id)
);

-- 创建 Kitchen 表
CREATE TABLE Kitchen (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    home_id INT,
    device_id_1 INT,
    device_id_2 INT,
    device_id_3 INT,
    device_id_4 INT,
    device_id_5 INT,
    FOREIGN KEY (home_id) REFERENCES Home(id)
);

-- 创建 Bathroom 表
CREATE TABLE Bathroom (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    home_id INT,
    device_id_1 INT,
    device_id_2 INT,
    device_id_3 INT,
    device_id_4 INT,
    device_id_5 INT,
    FOREIGN KEY (home_id) REFERENCES Home(id)
);

-- 更新 Home 表中的 Foreign Key 约束
ALTER TABLE Home
    ADD CONSTRAINT fk_bedroom_1 FOREIGN KEY (bedroom_1) REFERENCES Bedroom(room_id),
    ADD CONSTRAINT fk_bedroom_2 FOREIGN KEY (bedroom_2) REFERENCES Bedroom(room_id),
    ADD CONSTRAINT fk_living_room FOREIGN KEY (living_room) REFERENCES LivingRoom(room_id),
    ADD CONSTRAINT fk_kitchen FOREIGN KEY (kitchen) REFERENCES Kitchen(room_id),
    ADD CONSTRAINT fk_bathroom_1 FOREIGN KEY (bathroom_1) REFERENCES Bathroom(room_id),
    ADD CONSTRAINT fk_bathroom_2 FOREIGN KEY (bathroom_2) REFERENCES Bathroom(room_id);
    
-- 更新 各个房间 表中的 Foreign Key 约束
ALTER TABLE Bedroom
ADD CONSTRAINT fk_device_1 FOREIGN KEY (device_id_1) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_device_2 FOREIGN KEY (device_id_2) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_device_3 FOREIGN KEY (device_id_3) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_device_4 FOREIGN KEY (device_id_4) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_device_5 FOREIGN KEY (device_id_5) REFERENCES Devices(device_id);

ALTER TABLE LivingRoom
ADD CONSTRAINT fk_living_device_1 FOREIGN KEY (device_id_1) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_living_device_2 FOREIGN KEY (device_id_2) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_living_device_3 FOREIGN KEY (device_id_3) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_living_device_4 FOREIGN KEY (device_id_4) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_living_device_5 FOREIGN KEY (device_id_5) REFERENCES Devices(device_id);

ALTER TABLE Kitchen
ADD CONSTRAINT fk_Kitchen_device_1 FOREIGN KEY (device_id_1) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_Kitchen_device_2 FOREIGN KEY (device_id_2) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_Kitchen_device_3 FOREIGN KEY (device_id_3) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_Kitchen_device_4 FOREIGN KEY (device_id_4) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_Kitchen_device_5 FOREIGN KEY (device_id_5) REFERENCES Devices(device_id);

ALTER TABLE Bathroom
ADD CONSTRAINT fk_Bathroom_device_1 FOREIGN KEY (device_id_1) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_Bathroom_device_2 FOREIGN KEY (device_id_2) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_Bathroom_device_3 FOREIGN KEY (device_id_3) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_Bathroom_device_4 FOREIGN KEY (device_id_4) REFERENCES Devices(device_id),
ADD CONSTRAINT fk_Bathroom_device_5 FOREIGN KEY (device_id_5) REFERENCES Devices(device_id);

-- 在user表中增加homeid
ALTER TABLE `Users`
ADD COLUMN home_id INT,
ADD CONSTRAINT fk_home_user FOREIGN KEY (home_id) REFERENCES Home(id);

