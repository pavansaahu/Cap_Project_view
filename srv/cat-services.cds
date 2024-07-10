using { productdetailsproject as db } from '../db/data-model';

service CatalogService {

entity products as projection on db.Products;  // All products service

entity product_car as projection on db.Product_Car;  // product_car service
entity Characteristics_car as projection on db.Characteristics_Car; // Characteristics_Car service
entity product_bike as projection on db.Product_Bike; // Product_Bike service
entity Characteristics_bike as projection on db.Characteristics_Bike; // Characteristics_Bike service

}