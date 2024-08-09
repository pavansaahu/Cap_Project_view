using {myapp as pdb} from '../db/productdata-model';

service CatalogService1 {
    entity Products              as projection on pdb.Product;
    entity MasterCharacteristics as projection on pdb.MasterData;
    entity SubCategories         as projection on pdb.subCategoriesData;
    entity Characteristics       as projection on pdb.Characteristic;
    entity SubCharacteristics    as projection on pdb.SubCharacteristic;
    entity CharacteristicValues  as projection on pdb.CharacteristicValue;
    entity HierarchicalData      as projection on pdb.HierarchicalData;
    
    function GetHierarchicalData() returns String;

// function GetHierarchicalData() returns array of HierarchicalDataType;

// type HierarchicalDataType {
//     characteristicName   : String;
//     characteristicNumber : Integer;
//     subCharacteristics   : Composition of SubCharacteristicType
// }


// type SubCharacteristicType {
//     subCharacteristicName   : String;
//     subCharacteristicNumber : Integer;
//     values                  : array of String;
// }

// function GetHierarchicalData() returns array of {
//     CHARACTERISTICNAME : String;
//     CHARACTERISTICNUMBER : Integer;
//     SUBCHARACTERISTICNAME : String;
//     SUBCHARACTERISTICNUMBER : Integer;
//     VALUE : String;
// };

//function updateEmployee (eId :Integer,eName :String,ePhone:String(10),priority:String,criticality : Integer)returns String;
}
