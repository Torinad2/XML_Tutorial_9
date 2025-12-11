xquery version "1.0";

(: 
   New Perspectives on XML, 3rd Edition
   Tutorial 9
   Tutorial Assignment

   General query on stores and cities

   Author:     Nikita Baiborodov
   Date:       12/08/2025

   Filename:   gjc_query1.xq

 :)

<stateStores state="CO"
    storeCount="{
        count(doc('gjc_stores.xml')//store[state='CO'])
    }">
{
    doc('gjc_stores.xml')//store[state='CO']
}
</stateStores>

