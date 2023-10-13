using { sap.capire.bookshop as my } from '../db/schema';
service CatalogService @(path:'/catlog') {
    @readonly entity Books as select from my.Books {*, author.name as author} ;
    @insertonly entity Orders as projection on my.Orders;
}
