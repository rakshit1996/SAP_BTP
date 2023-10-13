sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'firsttile',
            componentId: 'BooksObjectPage',
            contextPath: '/Authors/books'
        },
        CustomPageDefinitions
    );
});