namespace sap.capire.bookshop;
using { Currency,managed} from '@sap/cds/common';

entity Books {
  key ID   : Integer;   //primary key
  title    : localized String(111);
  descr    : localized String(1111);
  author   : Association to Authors;  //foreign key
  stock    : Integer;
  price    : Decimal(9,2);
  currency : Currency;
}

entity Authors {
  key ID   : Integer;// primary key
  name     : String(111);
  books    : Association to many Books on books.author = $self;
}

entity Orders {
  key ID   : UUID;
  OrderNo  : String @title:'Order Number'; //> readable key
  Items    : Composition of many OrderItems on Items.parent = $self;
  currency:Currency
}
entity OrderItems {
  key ID   : UUID;
  parent   : Association to Orders;
  book     : Association to Books;
  amount   : Integer;
}
