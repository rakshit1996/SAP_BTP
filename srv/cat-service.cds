using { sap.capire.bookshop as my} from '../db/schema';

service CatalogService @(path:'/catlog') {
    @odata.draft.enabled
    @readonly entity Books as projection on  my.Books ;
    @readonly entity Authors as projection on my.Authors;
    @insertonly entity Orders as projection on my.Orders;
}