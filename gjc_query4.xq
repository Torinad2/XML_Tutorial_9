xquery version "1.0";

(: 
   New Perspectives on XML, 3rd Edition
   Tutorial 9
   Tutorial Assignment

   Return order totals grouped by store

   Author:     Nikita Baiborodov
   Date:       12/08/2025

   Filename:   gjc_query4.xq

 :)

<results>{
    let $stores := doc('gjc_stores.xml')//store
    let $orders := doc('gjc_orders.xml')//order
    for $s in $stores
    let $storeOrders := $orders[@storeID=$s/@storeID]
    let $storeTotal := sum($storeOrders/product/(@qty*@salesPrice))
    order by $storeTotal descending
    return
    <store id="{$s/@storeID}">
    {$s/street}
    {$s/city}
    {$s/state}
    <revenue>{
    concat("$",round-half-to-even($storeTotal,2))
    }</revenue>
    </store>
}</results>
