### Query 1
Select a.au_id, a.au_fname, a.au_lname, t.title, p.pub_name from authors as a
Join titleauthor as ta on a.au_id = ta.au_id
Join titles as t on t.title_id = ta.title_id
Join publishers as p on t.pub_id = p.pub_id;


### Query 2
Select a.au_id, a.au_fname, a.au_lname, p.pub_name, count(t.title) as `TITLE COUNT` from authors as a
Join titleauthor as ta on a.au_id = ta.au_id
Join titles as t on t.title_id = ta.title_id
Join publishers as p on t.pub_id = p.pub_id
Group by a.au_id, a.au_fname, a.au_lname, p.pub_name;


### Query 3
Select a.au_id, a.au_fname, a.au_lname, sum(s.qty) as total from authors as a
Join titleauthor as t on a.au_id = t.au_id
Join sales as s on s.title_id = t.title_id
Group by a.au_id
order by total desc
limit 3;


### Query 4
select a.au_id, a.au_fname, a.au_lname, COALESCE(sum(s.qty), 0) from authors as a
Left join titleauthor as ta on ta.au_id = a.au_id
left join titles as t on t.title_id = ta.title_id
left join sales as s on s.title_id = t.title_id
group by a.au_id
order by sum(s.qty) desc;