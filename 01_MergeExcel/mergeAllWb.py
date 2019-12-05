import pandas as pd
import os

WB_li = []
print("当前位置有以下文件 :", os.listdir())
for file_name in os.listdir():
    if file_name.endswith('.xlsx') and file_name != 'workBook.xlsx':
        data = pd.read_excel(file_name)
        WB_li.append(data)
result = pd.concat(WB_li)
result.to_excel('workBook.xlsx')
print(result.shape)