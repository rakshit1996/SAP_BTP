using  from './admin-service';

annotate AdminService.Books with @(
    UI: {
        Identification: [ {Value: title} ],
        SelectionFields: [ title ],
        LineItem: [
            {Value: ID},
            {Value: title},
            {Value: descr},
            {Value: author_ID},
            {Value: stock},
            {Value:price},
            {Value:currency_code}
        ],
        HeaderInfo: {
            TypeName: '{i18n>Book}',
            TypeNamePlural: '{i18n>Books}',
            Title: {Value: title},
            Description: {Value: author.name}
        }
    }
);

annotate AdminService.Books  with {
    ID @title:'{i18n>ID}' @UI.HiddenFilter;
    title @title:'{i18n>Title}';
    author @title:'{i18n>AuthorID}';
    stock @title:'{i18n>Stock}';
    descr @title:'{i18n>DESCR}';
    price @title:'{i18n>Price}';
    currency @title:'{i18n>Currency}';

    
}

annotate AdminService.Authors  with {
    ID @title:'{i18n>ID}' @UI.HiddenFilter;
    name @title:'{i18n>AuthorName}';
}