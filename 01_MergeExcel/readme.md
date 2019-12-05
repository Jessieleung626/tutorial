Hello 大家好！相信大家在工作中经常会遇到多个 Excel 表格的合并，这些表格格式类似，合并简单，但是有些甚至
烦人到合并整个月几十张表的数据，这些合并真的朴实无华，但着实枯燥，甚至到最后总有一小问题需要解决，今天
就是教大家能够使用 Python 更加高效的解决。废话不多说，开始吧！

mergeAllSheet 合并同一个WorkBook中所有的Sheet

第一种情况如果是一个 Excel 表里的多个 Sheet ，这种情况该怎么处理呢

首先我们需要 导入 pandas 和 os 库，pandas 是为了处理 Excel 表格，os 库是为了处理文件索引，看一下当前
所在的文件夹里有几个文件，当然这些文件都是我瞎编的，如果你想试试手，代码可以到我的微信公众号 数据小白
从零入门 或者 github 地址为： https://github.com/lovemyfat/tutorial 获取。

我们可以看到共有 3 个文件， workBook1， workBook2， workBook3, 我可以告诉大家的是，workBook1 里边有
多个 Sheet ，而后两个只有一个Sheet，所有我们这次我们只选择读取 workBook1 ，首先使用 pandas 的 ExcelFile
方法，有的同学可能会问，为什么不用 read_excel ，因为它读不出来所有 Sheet 名称啊，然后使用 parse 解析出
对应的 Sheet ，这样就可以得到了所有的分表的内容，可以运行看一下。

mergeAllWb    合并文件夹里所有的WorkBook的第一张Sheet

mergeAll      合并文件夹里所有的WorkBook的所有Sheet