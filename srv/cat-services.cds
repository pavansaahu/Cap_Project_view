using { productdetailsproject as db } from '../db/data-model';

service CatalogService {

entity products as projection on db.Products;  // All products service
entity Characteristics as projection on db.Characteristics; // Characteristics

}