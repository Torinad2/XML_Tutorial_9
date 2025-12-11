xquery version "1.0";

(: 
   New Perspectives on XML, 3rd Edition
   Tutorial 9
   Tutorial Assignment

   Return total revenue grouped by department with 
   a user-defined function

   Author:     Nikita Baiborodov
   Date:       12/08/2025

   Filename:   gjc_query6.xq

 :)

declare function local:deptOrders($d as xs:string)
as element()*
{
let $deptProducts :=
doc('gjc_products.xml')//product[department=$d]
let $orders := doc('gjc_orders.xml')//product
return $orders[@productID=$deptProducts/@productID]
};

declare function local:revenue($products)
as xs:string
{
concat('$',
round-half-to-even(
sum($products/(@qty*@salesPrice))
,2)
)
};

<results>{

for $d in distinct-values(doc('gjc_products.xml')//department)
return
<department name='{$d}'>
<revenue>
{local:revenue(local:deptOrders($d))}
</revenue>
</department>
}</results>
