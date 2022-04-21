
---Cau1:
select FullName = [FirstName] +' '+[LastName], [CustomerId],[Country]
from [dbo].[Customer]
where Country !='USA'

---Cau2:
select * from [dbo].[Customer]
where [Country] = 'Brazil'

---Cau3:
alter table [dbo].[Customer]
add Fullname varchar(255)
select *from [dbo].[Customer]
update [dbo].[Customer]
set Fullname = [FirstName] +' '+[LastName]
select *from [dbo].[Customer]
select Fullname, InvoiceID, 


Select Fullname, InvoiceID, InvoiceDate, BillingCountry
from [dbo].[Invoice]
inner join [dbo].[Customer]
on [dbo].[Customer].CustomerId = [dbo].[Invoice].CustomerId
where [BillingCountry] = 'Brazil'

---cau4:
select *from [dbo].[Employee]
where Title='Sales Support Agent';


---cau5:
select distinct BillingCountry
from [dbo].[Invoice]

---cau6:
select *from [dbo].[Invoice]
where [BillingCountry] = 'Brazil'

---cau7:
select * from [dbo].[Invoice]
alter table [dbo].[Employee]
add Fullname varchar(255)
select *from [dbo].[Employee]
update [dbo].[Employee]
set Fullname = [FirstName] +' '+[LastName]

select*from [dbo].[Invoice]
select *from [dbo].[Employee]


select [dbo].[Invoice].[BillingState], [dbo].[InvoiceLine].[UnitPrice],[dbo].[Employee].[Fullname]
from (([dbo].[Invoice]
inner join [dbo].[InvoiceLine]
on [dbo].[Invoice].InvoiceId = [dbo].[InvoiceLine].InvoiceId)
inner join [dbo].[Employee] on [dbo].[Employee].[State]=[dbo].[Invoice].[BillingState]);
order by Fullname

---cau8:

select [dbo].[Invoice].[Total], 
[dbo].[Customer].[Fullname],[dbo].[Invoice].[BillingCountry],[dbo].[Customer].[SupportRepId],
from [dbo].[Customer]
inner join [dbo].[Invoice] on [dbo].[Customer].[CustomerId]=[dbo].[Invoice].[CustomerId]


---cau 9:
select Year([InvoiceDate]) as InYear, sum([Total]) as TotalSale
from [dbo].[Invoice]
where year([InvoiceDate]) between 2009 and 2011
group by Year([InvoiceDate])

---cau7:Provide a query that shows the invoices associated with each sales agent. 
--The resultant table should include the Sales Agent's full name.
select Fullname = [dbo].[Employee].Fullname, [dbo].[Invoice].InvoiceId, [dbo].[Invoice].InvoiceDate
from [dbo].[Customer]
inner join Invoice on [dbo].[Customer].CustomerId = [dbo].[Invoice].CustomerId
inner join Employee on [dbo].[Customer].SupportRepId = [dbo].[Employee].EmployeeId
order by Fullname



---cau8:Provide a query that shows the Invoice Total, Customer name, Country and Sale
---Agent name for all invoices and customers.

select [dbo].[Invoice].[Total], 
[dbo].[Customer].[Fullname],[dbo].[Invoice].[BillingCountry],[dbo].[Customer].[SupportRepId],
from [dbo].[Customer]
inner join [dbo].[Invoice] on [dbo].[Customer].[CustomerId]=[dbo].[Invoice].[CustomerId]


---cau 9:How many Invoices were there in 2009 and 2011? What are the respective total sales
---for each of those years?
select Year([InvoiceDate]) as InYear, sum([Total]) as TotalSale
from [dbo].[Invoice]
where year([InvoiceDate]) between 2009 and 2011
group by Year([InvoiceDate])



---cau10:Looking at the InvoiceLine table, provide a query that COUNTs the number of line
---items for Invoice ID 37.
select count ([InvoiceId]) as InIDcnumber
from [dbo].[InvoiceLine]
where [InvoiceId] = 37

---cau11: Looking at the InvoiceLine table, provide a query that COUNTs the number of line
---items for each Invoice.select [InvoiceId] as InID, count ([InvoiceId]) as LineItemsfrom [dbo].[InvoiceLine]group by [InvoiceId]---cau 12: Provide a query that includes the track name with each invoice line item.select [Name], [dbo].[InvoiceLine].[InvoiceId]from [dbo].[Track]inner join [dbo].[InvoiceLine] on [dbo].[Track].[TrackId]= [dbo].[InvoiceLine].TrackId---cau13:Provide a query that includes the purchased track name AND artist name with each
---invoice line item.select [dbo].[Track].Name, [dbo].[Track].TrackId, [dbo].[Album].[ArtistId], [dbo].[InvoiceLine].InvoiceLineId, [dbo].[Artist].Name as NameArtistfrom [dbo].[InvoiceLine]inner join [dbo].[Track] on [dbo].[InvoiceLine].TrackId = [dbo].[Track].TrackIdinner join [dbo].[Album] on [dbo].[Album].AlbumId = [dbo].[Track].AlbumIdinner join [dbo].[Artist] on [dbo].[Album].ArtistId = [dbo].[Artist].ArtistId---cau14: Provide a query that shows the # of invoices per countryselect count([InvoiceId]) as 'Nunmber of invoces', [BillingCountry]from [dbo].[Invoice]group by [BillingCountry]---cau14: Provide a query that shows the # of invoices per countryselect count([BillingCountry]) as 'Number of Invoices' , [BillingCountry] as Countryfrom [dbo].[Invoice]group by [BillingCountry]---cau15: Provide a query that shows the total number of tracks in each playlist. The Playlist
---name should be include on the resultant table.select count([TrackId]) as 'Number of tracks',[PlaylistId]from [dbo].[PlaylistTrack]group by [PlaylistId]---cau16:Provide a query that shows all the Tracks, but displays no IDs. The resultant table
---should include the Album name, Media type and Genre.
select [dbo].[Track].Name,[dbo].[Track].Bytes,[dbo].[Track].Composer, 
[dbo].[Track].GenreId, [dbo].[Track].MediaTypeId, [dbo].[Track].Milliseconds,
[dbo].[Track].UnitPrice
from [dbo].[Track]
inner join[dbo].[Album] on [dbo].[Track].AlbumId = [dbo].[Album].AlbumId
inner join [dbo].[MediaType] on [dbo].[Track].MediaTypeId = [dbo].[MediaType].MediaTypeId
inner join [dbo].[Genre] on [dbo].[Track].GenreId = [dbo].[Genre].GenreId

---cau17:Provide a query that shows all Invoices but includes the # of invoice line items.select [dbo].[Invoice].InvoiceId,count([dbo].[InvoiceLine].[InvoiceLineId]) as 'Number of Invoice Line'
from [dbo].[Invoice]
inner join [dbo].[InvoiceLine] on [dbo].[Invoice].InvoiceId = [dbo].[InvoiceLine].InvoiceId
group by ([dbo].[Invoice].InvoiceId)


----cau18: Provide a query that shows total sales made by each sales agent.
select [dbo].[Employee].Fullname, sum([dbo].[Invoice].[Total]) as 'Total Sales'
from [dbo].[Customer]
inner join [dbo].[Employee] on [dbo].[Customer].SupportRepId = [dbo].[Employee].EmployeeId 
inner join [dbo].[Invoice] on  [dbo].[Customer].CustomerId = [dbo].[Invoice].CustomerId
group by [dbo].[Employee].Fullname

---cau19:Which sales agent made the most in sales in 2009?
select top 1 [dbo].[Employee].[Fullname], sum([dbo].[Invoice].[Total]) as 'Total Sales'
from [dbo].[Customer]
inner join [dbo].[Employee] on [dbo].[Customer].[SupportRepId] =[dbo].[Employee].EmployeeId
inner join [dbo].[Invoice] on [dbo].[Customer].CustomerId = [dbo].[Invoice].CustomerId
where [dbo].[Employee].[Title] = 'Sales Support Agent' and year([dbo].[Invoice].[InvoiceDate]) = 2009
Group by [dbo].[Employee].[Fullname]
order by sum([dbo].[Invoice].[Total]) desc

---cau20:Which sales agent made the most in sales in 2010?
select top 1 [dbo].[Employee].[Fullname], sum([dbo].[Invoice].[Total]) as 'Total Sales'
from [dbo].[Customer]
inner join [dbo].[Employee] on [dbo].[Customer].[SupportRepId] =[dbo].[Employee].EmployeeId
inner join [dbo].[Invoice] on [dbo].[Customer].CustomerId = [dbo].[Invoice].CustomerId
where [dbo].[Employee].[Title] = 'Sales Support Agent' and year([dbo].[Invoice].[InvoiceDate]) = 2010
Group by [dbo].[Employee].[Fullname]
order by sum([dbo].[Invoice].[Total]) desc




---cau21:Which sales agent made the most in sales over all?select top 1 [dbo].[Employee].[Fullname], sum([dbo].[Invoice].[Total]) as 'Total Sales'
from [dbo].[Customer]
inner join [dbo].[Employee] on [dbo].[Customer].[SupportRepId] =[dbo].[Employee].EmployeeId
inner join [dbo].[Invoice] on [dbo].[Customer].CustomerId = [dbo].[Invoice].CustomerId
where [dbo].[Employee].[Title] = 'Sales Support Agent' 
Group by [dbo].[Employee].[Fullname]
order by sum([dbo].[Invoice].[Total]) desc


---cau22: Provide a query that shows the # of customers assigned to each sales agent.
select [dbo].[Employee].Fullname, count([dbo].[Customer].[SupportRepId]) as 'Num of Customers'
from [dbo].[Customer]
inner join [dbo].[Employee] on [dbo].[Customer].SupportRepId = [dbo].[Employee].EmployeeId
group by [dbo].[Employee].Fullname

---cau23:Provide a query that shows the total sales per country. select [BillingCountry] ,sum([Total]) as 'Total Sales'from [dbo].[Invoice]group by [BillingCountry]---Which country's customers spent the most?select top 1 [BillingCountry] ,sum([Total]) as 'Total Sales'from [dbo].[Invoice]group by [BillingCountry]order by sum([Total]) desc---cau24:Provide a query that shows the most purchased track of 2013.
select  [dbo].[Track].Name  , count([dbo].[InvoiceLine].TrackId) as 'Number of Purchases'
from [dbo].[InvoiceLine]
inner join [dbo].[Track] on [dbo].[InvoiceLine].TrackId=[dbo].[Track].TrackId
inner join [dbo].[Invoice] on [dbo].[InvoiceLine].InvoiceId=[dbo].[Invoice].InvoiceId
where year([dbo].[Invoice].[InvoiceDate]) = 2013
group by [dbo].[Track].Name
order by count([dbo].[InvoiceLine].TrackId) desc



---cau25: Provide a query that shows the top 5 most purchased tracks over all
select top 5 [dbo].[Track].Name  , count([dbo].[Track].TrackId) as 'Number of Purchases'
from [dbo].[InvoiceLine]
inner join [dbo].[Track] on [dbo].[InvoiceLine].TrackId=[dbo].[Track].TrackId
inner join [dbo].[Invoice] on [dbo].[InvoiceLine].InvoiceId=[dbo].[Invoice].InvoiceId
group by [dbo].[Track].Name
order by count([dbo].[InvoiceLine].TrackId) desc
 

---cau26: Provide a query that shows the top 3 best selling artists.
select top 3 [dbo].[Artist].Name, count([dbo].[InvoiceLine].[TrackId])
from [dbo].[Album],[dbo].[Artist],[dbo].[InvoiceLine],[dbo].[Track]
where  [dbo].[Album].AlbumId = [dbo].[Track].AlbumId
and [dbo].[Album].ArtistId = [dbo].[Artist].ArtistId
and [dbo].[Track].[TrackId] = [dbo].[InvoiceLine].[TrackId]
group by [dbo].[Artist].Name
order by (count([dbo].[InvoiceLine].[TrackId])) desc
---cau27&28:Provide a query that shows the most purchased Media Type.
select top 1 [dbo].[MediaType].Name, count([dbo].[InvoiceLine].[TrackId])
from [dbo].[Track]
inner join [dbo].[MediaType] on [dbo].[Track].MediaTypeId = [dbo].[MediaType].MediaTypeId
inner join [dbo].[InvoiceLine] on [dbo].[Track].TrackId = [dbo].[InvoiceLine].TrackId
group by [dbo].[MediaType].Name
order by count([dbo].[InvoiceLine].[TrackId]) desc

