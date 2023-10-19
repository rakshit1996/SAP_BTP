using from './admin-service';
@odata.draft.enabled

// Books entity annotation for app/adminapp/admin_app_index.html

annotate AdminService.Books with @(
    UI: {
        HeaderInfo: {
            TypeName: '{i18n>Book}',
            TypeNamePlural: '{i18n>Books}',
            Title: { $Type: 'UI.DataField', Value: title },
            Description: { $Type: 'UI.DataField' , Value: author.name},
        },
        Identification: [ {Value: title} ],
        SelectionFields: [ title,author_ID,descr],  // adds filter tab
        LineItem: [
            {Value: ID},
            {Value: title},
            {Value: author_ID},
            {Value: stock},
            {Value:price},
            {Value:currency_code}
      
        ],
        
          HeaderFacets: [       
        {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#BookDetail', Label:'{i18n>BookDetail}' },
        {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#AuthorDetails', Label:'{i18n>AuthorDetails}' },
        {$Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Price'},
        {$Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Currency'},
       
        
      ],
      Facets: [  // this will appear in the item level details //
        {
          $Type: 'UI.CollectionFacet',
          Label: '{i18n>BookDetails}',
          Facets: [
            {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Description', Label: '{i18n>BookDetails}'},
          ]
        }
      ],
      DataPoint#Currency:{Value:currency_code,Title:'{i18n>Curreny code }'},
      DataPoint#Price: {Value: price, Title: '{i18n>PRICE}'},
      
      FieldGroup#Description: {
        Data:[
            {$Type: 'UI.DataField', Value: descr}
        ]
      },

      FieldGroup#BookDetail: {
        Data:[
          {$Type: 'UI.DataField', Value: ID},
          {$Type: 'UI.DataField', Value: stock}
        ]
      },

      FieldGroup#AuthorDetails:{
        Data:[
          {$Type: 'UI.DataField', Value: author_ID},
          {$Type: 'UI.DataField', Value: name}

        ]
      },

    }
);



annotate AdminService.Books  with {
    ID @title:'{i18n>ID}' @UI.HiddenFilter;
    title @title:'{i18n>Title}' @UI.HiddenFilter;
    author @title:'{i18n>AuthorID}';
    stock @title:'{i18n>Stock}';
    descr @title:'{i18n>DESCR}';
    price @title:'{i18n>Price}';
    currency @title:'{i18n>Currency}';    
}

annotate AdminService.Authors  with {
    ID @title:'{i18n>ID}' @UI.HiddenFilter;
    name @title:'{i18n>AuthorName}';
    books @title:'{i18n>title}';
}
