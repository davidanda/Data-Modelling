--publishers that published more than one journal
select p.publishername, p.phonenumber, p.email, p.address, p.country, count(j.journalname) as journals_published
from publisher p
inner join journal j on p.publisherid = j.publisherid
group by p.publishername, p.phonenumber, p.email, p.address, p.country
having count(j.journalname) > 1
order by journals_published desc;

--Names of academics (Data Science & Mathematics) and the editor incharge of the journal they submitted to
WITH journEd (editorname, email, phonenumber, journalname, journalid)
AS 
(
    select ed.editorname, ed.email, ed.phonenumber, j.journalname, j.journalid
    from edits e
    inner join editor ed on e.editorid = ed.editorid
    inner join journal j on e.journalid = j.journalid
)

select a.firstname, a.lastname, p.pubtitle as publication, j.editorname, j.phonenumber
from academics a
inner join publication p on a.authorid = p.authorid
inner join journEd j on j.journalid = p.journalid
where researchfield IN (SELECT researchfield from academics WHERE researchfield IN ('Data Science', 'Mathematics'));

--all organisations that are Universities and the Journals they are subscribed to
select j.journalname as journal, o.orgname as organisation
from journal j
inner join subscription s on j.journalid = s.journalid
inner join organisation o on o.orgid = s.orgid
where orgname IN (select orgname from organisation where orgname LIKE '%University%');

--all journals that got published/issued after 2021 sorted from earliest to latest
select j.journalname as journal, i.issuedate as dateOfIssue
from journal j
inner join issue i on j.journalid = i.journalid
WHERE j.journalname LIKE '%Science%' and extract(year from i.issuedate) > 2021
order by i.issuedate asc;

--all publications: reviewed by, reviewed date, status, journal
select p.pubtitle as publication, r.reviewdate as dateReviewed, a.firstname || ' ' || a.lastname as reviewedBy, r.reviewresult as status, j.journalname as journal
from publication p
inner join review r on p.publicationid = r.publicationid
inner join academics a on a.authorid = r.authorid
inner join journal j on j.journalid = p.journalid
where r.reviewresult = 'Accept'
order by 2 desc;





