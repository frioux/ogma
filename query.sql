   SELECT snippet(booksearch, 0, '>>>', '<<<', '???', 64), rank
    FROM booksearch
   WHERE fulltext MATCH 'diamond'
ORDER BY rank desc;
