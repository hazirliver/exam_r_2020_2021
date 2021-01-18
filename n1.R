cur.date <- function(type)
{
  today <- Sys.Date()
  switch(type,
    long = format(today, format = '%A %B %d %Y'),
    short = format(today, format = '%d-%m-%y')
  )
  # if (type == 'long')
  # {
  #   to.out <- format(today, format = '%A %B %d %Y')
  #   return(to.out)
  # }
  # if (type == 'short')
  # {
  #   to.out <- format(today, format = '%d %m %y')
  #   return(to.out)
  # }
}
cur.date('long')
cur.date('short')

# Для других форматов дат можно есть таблица форматов:
# https://www.statmethods.net/input/dates.html