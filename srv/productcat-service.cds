using {interaction} from '../db/productdata-model';
using { V_INTERACTION } from '../db/productdata-model';


service CatalogService1 {
    entity Products              as projection on interaction.Product;
    entity MasterCharacteristics as projection on interaction.MasterData;
    entity SubCategories         as projection on interaction.subCategoriesData;
    entity Characteristics       as projection on interaction.Characteristic;
    entity SubCharacteristics    as projection on interaction.SubCharacteristic;
    entity CharacteristicValues  as projection on interaction.CharacteristicValue;
    entity HierarchicalData      as projection on interaction.HierarchicalData;
    entity Interactions          as projection on V_INTERACTION;
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
