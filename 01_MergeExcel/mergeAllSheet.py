import pandas as pd
import os

print("当前位置有以下文件 :", os.listdir())
file_name = 'workBook1.xlsx'
print("选择文件为", file_name)
workBook = pd.ExcelFile(file_name)
print("当前 WorkBook 有以下 Sheet :", workBook.sheet_names)
sheet_li = []
for sheet_name in workBook.sheet_names:
    Sheet = workBook.parse(sheet_name)
    Sheet['日期'] = Sheet['日期'].map(lambda x: x.date())
    sheet_li.append(Sheet)
result = pd.concat(sheet_li, ignore_index=True)
result.to_excel('workBook.xlsx')
print(result.shape)