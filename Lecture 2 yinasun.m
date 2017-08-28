import xlrd
import xlsxwriter
import numpy as np

workbook=xlrd.open_workbook('NYHarborPrices.xls')
sheet=workbook.sheet_by_index(1)

yearlyAverage=[]
yearlyData=[]

for i in range(10,369):
    value=sheet.cell_value(i,1)
    yearlyData.append(value)

start = 0

for i in range(0,30):
    avg=np.mean(yearlyData[start:start+12])
    yearlyAverage=np.append(yearlyAverage, avg)
    start +=12

finalData=np.zeros((30,2))
finalData[0:30,0]=1987+np.arange(30)
finalData[0:30,1]=yearlyAverage
    
workbook=xlsxwriter.Workbook('YearlyAverage.xls')
worksheet=workbook.add_worksheet()

row=1
col=0

worksheet.write(col,0,'Year')
worksheet.write(col, 1, 'Average Price')

for item, price in (finalData):
    worksheet.write(row, col, item)
    worksheet.write(row, col+1, price)
    row +=1
    
workbook.close()
