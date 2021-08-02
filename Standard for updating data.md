## Standard for updating data

This document briefly sets out how I expect data for the resilience/recovery dashboard should be gathered. The main emphasis should be on making this process as efficient and unobtrusive as possible. At the same time, it should also aim to minimise situations where data is automatically downloaded and processed if it has been changed or is no longer correct. I hope that most of this work will fit neatly into what you are doing with the data anyway, or will at least give you better familiarity with a useful data source that people want to know about and understand.

### Gathering data

Order of preference:

1. **API**: This is tricky to set up, but should be the most straightforward to keep up to date. If you know there is an API somewhere to get the data, let me know and I'll look into getting the data that way.
2. **Downloading files directly from website**: There is often not an API, but data is uploaded to a website in the form of a csv or Excel file. This can be downloaded and processed automatically. There will likely need to be some kind of processing before being able to add to the database. It is also worth thinking about automated testing, as well as manual QA is done on this on a regular basis.
3. **Using files on shared drive/sharepoint**. It's probably a good idea to keep the file that you send me in a similar shape to how it is when you first download it. From there, if we can have some kind of record of what is done to it before it goes into the database, that will help for when different people need to work on it.
   1. For Shared drive files - keep a "latest version", rather than renaming it every time to you update it
   2. On Sharepoint/Onedrive, host the files in the shared DPA directory (same one as where the main spreadsheet sits)
   3.  Try to keep an eye on formatting changes

### Checking data

As most people who work with data are aware, data providers are not always great at keeping their data consistently. Often column headers, file names, formatting of numbers can change without warning. There can also be missing data and changes to how data is collected that will need to be understood, and possibly communicated within the data. 

There are things we can do to get a head-start. This project should be test-driven. So there are ways we can automatically test that, say the headings are what we expect them to be. If we have a percentage value, we could make sure that values are either between 0 and 100 or 0 and 1. It is still a good idea to sense check the data periodically.

### Checking the output

It is the indicator owner to check that the numbers are correct, as above, but also the charts look right as well.

In particular, I would expect the following to be checked periodically:

* The chart title is correct - not misleading
* X-axis title
* Y-axis title
* Y-axis ticks (is it % or not, are the correct numbers)
* X-axis formatting
* Legend labels

