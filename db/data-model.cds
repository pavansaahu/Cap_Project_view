namespace productdetailsproject;

entity Products {
    key ID       : UUID @readonly;  // Auto-generated unique ID
    productName  : String(50);      // Product name
}

entity Characteristics {
     key ID              : UUID @readonly;  // Auto-generated unique ID
    product             : Association to Products; // Association to Products
    characteristicName  : String(255);     // Characteristic name
    characteristicValue : String(255);     // Characteristic value
}


