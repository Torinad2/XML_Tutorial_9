xquery version "1.0";

(: 
   New Perspectives on XML, 3rd Edition
   Tutorial 9
   Tutorial Assignment

   Query to calculate total revenue from all orders

   Author:     Nikita Baiborodov
   Date:       12/08/2025

   Filename:   gjc_query3.xq

 :)

<revenue>{
   concat("$",
      round-half-to-even(
         sum(
            for $o in doc('gjc_orders.xml')//order
            let $total := sum($o/product/(@qty * @salesPrice))
            return $total
         ),
      2)
   )
}</revenue>