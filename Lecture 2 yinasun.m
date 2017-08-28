import xlrd
import xlsxwriter

#File imported
file_location = "/Users/ys/Dropbox/ENEC490/NYHarborPrices.xls"
workbook=xlrd.open_workbook(file_location)
sheet=workbook.sheet_by_index(1)


[CODE FOR AVERAGE, but I don't really know how to comute it]

#File exported
workbook=xlsxwriter.Workbook('YearlyAverage.xls')
worksheet=workbook.add_worksheet()

averages=(
        ['1987', 1],
        ['1988', 2],
        ['1989', 3],
        ['1990', 3],
        ['1991', 3],
        ['1992', 3],
        ['1993', 3],
        ['1994', 3],
        ['1995', 3],
        ['1996', 3],
        ['1997', 3],
        ['1998', 3],
        ['1999', 3],
        ['2000', 3],
        ['2001', 3],
        ['2002', 3],
        ['2003', 3],
        ['2004', 3],
        ['2005', 3],
        ['2006', 3],
        ['2007', 3],
        ['2008', 3],
        ['2009', 3],
        ['2010', 3],
        ['2011', 3],
        ['2012', 3],
        ['2013', 3],
        ['2014', 3],
        ['2015', 3],
        ['2016', 3],
        )
row=1
col=0

worksheet.write(col,0,'Year')
worksheet.write(col, 1, 'Average Price')

for item, price in (averages):
    worksheet.write(row, col, item)
    worksheet.write(row, col+1, price)
    row +=1
    
workbook.close()
