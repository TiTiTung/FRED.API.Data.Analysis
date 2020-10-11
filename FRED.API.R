# 从CRAN安装软件包
#install.packages("fredr")
# 加载包
library(fredr)

source("packages.you.need.R")



fredr_set_key("9ad4fddb89db12ac59ebbb321a29c884")



DGS_ID <- c("DGS3MO", "DGS2", "DGS5", "DGS10", "DGS20", "DGS30")

DGS = map_dfr(DGS_ID, fredr) %>%
  spread(key = series_id, value = value) %>%
  filter(date > "2015-01-02")

ss=fredr("ICSA")
DAUPSA

# 搜索汽车生产系列的数据库
search_ls <- fredr_series_search_text("car production")
# 加载ggplot2 R包
library(ggplot2)

# DAUPSA是按季节调整的每月国内汽车产量（单位）的ID
series_ls <-fredr_series_observations(series_id = "PAYEMS") %>%
  mutate(diff = c(NA, diff(value))) %>%
  filter(date > "2020-01-01")



series_ls$valuediff(series_ls$value)

# 将系列列表转换为数据框
series_df <- do.call(cbind.data.frame, series_ls)

TX.diff.timeseries <- xts(series_ls[,-1], as.Date(series_ls$date))

TX.diff.timeseries$diff %<>% as.numeric()

highchart() %>%
  hc_title(text = list(str_c("TX 近遠月價差分佈圖"))) %>%
  hc_subtitle(text = list("Source: Source: TAIFEX Database")) %>%
  hc_xAxis(categories = series_df$date) %>%
  hc_add_series(series_df$diff, yAxis = 0, name = "TX_spread") %>%
  hc_add_theme(hc_theme_smpl())

library(readxl)

write_excel_csv(series_ls, "myworkbook.xlsx", append = T)


library("xlsx")
library(openxlsx)
# Write the first data set in a new workbook
write.xlsx(USArrests, file = "myworkbook.xlsx",
           sheetName = "USA-ARRESTS", append = FALSE)
# Add a second data set in a new worksheet
write.xlsx(mtcars, file = "myworkbook.xlsx",
           sheetName="MTCARS", append=TRUE)
# Add a third data set
write.xlsx(iris, file = "myworkbook.xlsx",
           sheetName="IRIS", append=TRUE)

addWorksheet(iris, "IRIS 1")



### 有多個sheet要寫入檔案，或是要調整sheet的style
wb <- createWorkbook()

# 增加sheet
addWorksheet(wb, "sheetName")
addWorksheet(wb, "sheet2")
# # 設定欄位寬度
# setColWidths(wb, sheet, cols = c(1:4), widths = c(rep(25, 3), 30))
#
# # 增加style
# headerStyle <- createStyle(fgFill = "yellow", border = "TopBottomLeftRight", halign = "center", textDecoration = "bold", fontSize = 12)
#
# addStyle(wb, sheet = sheet, headerStyle, row = 1, cols = 4, gridExpand = TRUE, stack = TRUE)
#
# # 加上filter
# addFilter(wb, 1, row = 1, cols = 1:ncol(d))

# 寫檔
writeData(wb, sheet = "sheetName", series_ls)
writeData(wb, sheet = "sheet2", iris)
# 存檔
saveWorkbook(wb, "file.xlsx", overwrite = TRUE)
