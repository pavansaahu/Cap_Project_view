namespace productdetailsproject;


entity Products {
    key ID:UUID @readonly;
    
    productCar  : Association to Product_Car; // Association to Product_Car
    productBike : Association to Product_Bike; // Association to Product_Bike
    
}


entity Product_Car {
    key ID       : UUID @readonly;  // Auto-generated unique ID
    productName  : String(50);      // Product name
}

entity Characteristics_Car {
    key ID          : UUID @readonly;  // Auto-generated unique ID
    product         : Association to Product_Car; // Association to Products_Car
    description     : String(255);     // Description
    color           : String(30);      // Color
    mileage         : Integer;         // Mileage in kilometers/miles
    transmissionType: String(20);      // Transmission type (e.g., Automatic, Manual)
    fuelType        : String(20);      // Fuel type (e.g., Petrol, Diesel, Electric)
    engineSize      : Decimal(3,1);    // Engine size in liters
    horsepower      : Integer;         // Horsepower
    numberOfDoors   : Integer;         // Number of doors
    seatingCapacity : Integer;         // Seating capacity
    VIN             : String(17);      // Vehicle Identification Number
    registrationNumber : String(15);   // Registration number
}


entity Product_Bike {
     key ID       : UUID @readonly;  // Auto-generated unique ID
    productName  : String(50);      // Product name
}

entity Characteristics_Bike {
    key ID          : UUID @readonly;  // Auto-generated unique ID
    product         : Association to Product_Bike; // Association to Product_Bike
   
    color           : String(30);      // Color
    mileage         : Integer;         // Mileage in kilometers/miles
    transmissionType: String(20);      // Transmission type (e.g., Automatic, Manual)
    fuelType        : String(20);      // Fuel type (e.g., Petrol, Diesel, Electric)
    engineSize      : Decimal(3,1);    // Engine size in liters
    horsepower      : Integer;         // Horsepower
    VIN             : String(17);      // Vehicle Identification Number
    registrationNumber : String(15);   // Registration number
}