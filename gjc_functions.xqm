(: 
   New Perspectives on XML, 3rd Edition
   Tutorial 9
   Tutorial Assignment

   Library Module for Green Jersey Cycling

   Author:     Nikita Baiborodov
   Date:       12/08/2025

   Filename:   gjc_functions.xqm

 :)

module namespace gjc = "http://www.example.com/gjc";

declare variable $gjc:stores := doc('gjc_stores.xml')//store;
declare variable $gjc:orders := doc('gjc_orders.xml')//order;
declare variable $gjc:products := doc('gjc_products.xml')//product;

(: --- User-defined functions --- :)

declare function gjc:storeDeptOrders($sID as xs:string, $dept as xs:string)
       as element()*
{
    let $deptProducts := $gjc:products[department=$dept]
    return $gjc:orders[@storeID=$sID]/product
           [@productID=$deptProducts/@productID]
};

declare function gjc:revenue($products) as xs:string
{
    concat("$",
        round-half-to-even(
            sum($products/(@qty * @salesPrice))
        , 2)
    )
};
