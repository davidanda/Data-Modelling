//DATA INSERTION TO CREATE NODES AND EDGES

//academics data load
LOAD CSV WITH HEADERS FROM 'file:///academics.csv' AS row
WITH toInteger(row.author_id) AS author_id, row.address AS address, row.research_field AS research_field, 
row.last_name AS last_name, row.phone_number AS phone_number, row.first_name AS first_name, row.email AS email
MERGE (a:Academics {author_id: author_id, first_name: first_name, last_name: last_name, email: email, phone_number: phone_number, address: address, research_field: research_field})
RETURN count(a);


//publication data load new
LOAD CSV WITH HEADERS FROM 'file:///publication.csv' AS row
WITH toInteger(row.journalID) AS journalID,  toInteger(row.publicationID) AS publicationID, 
toInteger(row.authorID) AS authorID, row.title AS title, row.researchArea AS researchArea, 
date(datetime({epochmillis: apoc.date.parse(row.acceptanceDate, "ms", "dd-MMM-yy")})) AS acceptanceDate, date(datetime({epochmillis: apoc.date.parse(row.submissionDate,"ms", "dd-MMM-yy")})) AS submissionDate
MERGE (p:Publication {journalID: journalID, publicationID: publicationID, title: title, researchArea: researchArea, authorID: authorID, 
submissionDate: submissionDate, acceptanceDate: acceptanceDate})
RETURN count(p);


//academic -submits- publication relationship
LOAD CSV WITH HEADERS FROM 'file:///publication.csv' AS row
WITH toInteger(row.authorID) AS authorID,  toInteger(row.publicationID) AS publicationID
MATCH (p:Publication {publicationID: publicationID})
MATCH (a:Academics {author_id: authorID})
MERGE (a)-[:SUBMITS]->(p);

//journal data load
LOAD CSV WITH HEADERS FROM 'file:///journal.csv' AS row
WITH toInteger(row.journal_id) AS journal_id,  toInteger(row.publisher_id) AS publisher_id, row.journal_name AS journal_name
MERGE (j:Journal {journal_id: journal_id, publisher_id: publisher_id, journal_name: journal_name})
RETURN count(j);


//issue data load
LOAD CSV WITH HEADERS FROM 'file:///issue.csv' AS row
WITH toInteger(row.journal_id) AS journal_id, toInteger(row.issue_id) AS issue_id, date(datetime({epochmillis: apoc.date.parse(row.issue_date, "ms", "dd-MMM-yy")})) AS issue_date
MERGE (i:Issue {issue_id: issue_id, journal_id: journal_id, issue_date: issue_date})
RETURN count(i);

//publication - journal relationship
LOAD CSV WITH HEADERS FROM 'file:///publication.csv' AS row
WITH toInteger(row.journalID) AS journalID,  toInteger(row.publicationID) AS publicationID
MATCH (p:Publication {publicationID: publicationID})
MATCH (j:Journal {journal_id: journalID})
MERGE (p)-[:ISLINKEDTO]->(j);


//issue - journal relationship
LOAD CSV WITH HEADERS FROM 'file:///issue.csv' AS row
WITH toInteger(row.journal_id) AS journal_id, toInteger(row.issue_id) AS issue_id
MATCH (i:Issue {issue_id: issue_id})
MATCH (j:Journal {journal_id: journal_id})
MERGE (j)-[:HAS]->(i);


//review data load
LOAD CSV WITH HEADERS FROM 'file:///review.csv' AS row
WITH toInteger(row.publicationID) AS publicationID, toInteger(row.authorID) AS authorID, date(datetime({epochmillis: apoc.date.parse(row.reviewDate, "ms", "dd-MMM-yy")})) AS reviewDate, row.reviewResult AS reviewResult
MATCH (a:Academics {author_id: authorID})
MATCH (p:Publication {publicationID: publicationID})
MERGE (a)-[rel:REVIEW {reviewDate: reviewDate,
reviewResult: reviewResult}]->(p)
RETURN count(rel);


//affiliation data load
LOAD CSV WITH HEADERS FROM 'file:///affiliation.csv' AS row
WITH toInteger(row.authorID) AS authorID, toInteger(row.orgID) AS orgID
MATCH (a:Academics{author_id: authorID})
MATCH (o:Organisation {org_id: orgID})
MERGE (a)-[rel:AFFILIATION]->(o)
RETURN count(rel);


//editor data load
LOAD CSV WITH HEADERS FROM 'file:///editor.csv' AS row
WITH toInteger(row.editorID) AS editorID, row.phoneNumber AS phoneNumber, row.name AS name, row.email AS email
MERGE (e:Editor {editorID: editorID, name: name, email: email, phoneNumber: phoneNumber})
RETURN count(e);


//edits data load
LOAD CSV WITH HEADERS FROM 'file:///edit.csv' AS row
WITH toInteger(row.editor_id) AS editor_id, toInteger(row.journal_id) AS journal_id
MATCH (j:Journal {journal_id: journal_id})
MATCH (e:Editor {editorID: editor_id})
MERGE (e)-[rel:EDITS]->(j)
RETURN count(rel);


//subscribe data load
LOAD CSV WITH HEADERS FROM 'file:///subscribe.csv' AS row
WITH toInteger(row.journalID) AS journalID, toInteger(row.orgID) AS orgID
MATCH (j:Journal {journal_id: journalID})
MATCH (o:Organisation {org_id: orgID})
MERGE (o)-[rel:SUBSCRIBE]->(j)
RETURN count(rel);


//organisation data load
LOAD CSV WITH HEADERS FROM 'file:///organisation.csv' AS row
WITH toInteger(row.org_id) AS org_id, row.org_country AS org_country, row.org_address AS org_address, row.org_name AS org_name
MERGE (o:Organisation {org_id: org_id, org_name: org_name, org_address: org_address, org_country: org_country})
RETURN count(o);


//affiliation data load
LOAD CSV WITH HEADERS FROM 'file:///affiliation.csv' AS row
WITH toInteger(row.authorID) AS authorID, toInteger(row.orgID) AS orgID
MATCH (a:Academics{author_id: authorID})
MATCH (o:Organisation {org_id: orgID})
MERGE (a)-[rel:AFFILIATION]->(o)
RETURN count(rel);


//publisher data load
LOAD CSV WITH HEADERS FROM 'file:///publisher.csv' AS row
WITH toInteger(row.publisher_id) AS publisher_id, row.country AS country, row.address AS address, row.name AS name, row.phone_number AS phone_number, row.email AS email
MERGE (p:Publisher {publisher_id: publisher_id, name: name, email: email, phone_number: phone_number, address: address, country: country})
RETURN count(p);

//publisher - journal relationship
LOAD CSV WITH HEADERS FROM 'file:///journal.csv' AS row
WITH toInteger(row.journal_id) AS journal_id,  toInteger(row.publisher_id) AS publisher_id
MATCH (p:Publisher {publisher_id: publisher_id})
MATCH (j:Journal {journal_id: journal_id})
MERGE (p)-[:PUBLISHES]->(j);