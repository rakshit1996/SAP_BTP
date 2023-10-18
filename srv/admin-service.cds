using { sap.capire.bookshop as my} from '../db/schema';

service AdminService @(path:'/admin') {
   @odata.draft.enabled
   entity Books as select from  my.Books{*} ;
   entity Authors as projection on my.Authors;
   entity Orders as projection on my.Orders;
   entity OrderItems as projection on my.OrderItems;

}

