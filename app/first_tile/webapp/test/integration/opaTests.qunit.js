sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'firsttile/test/integration/FirstJourney',
		'firsttile/test/integration/pages/AuthorsList',
		'firsttile/test/integration/pages/AuthorsObjectPage',
		'firsttile/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, AuthorsList, AuthorsObjectPage, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('firsttile') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheAuthorsList: AuthorsList,
					onTheAuthorsObjectPage: AuthorsObjectPage,
					onTheBooksObjectPage: BooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);