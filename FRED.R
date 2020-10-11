source("packages.you.need.R")
library(fredr)
fredr_set_key("My Key")

#==========================================================================
# T-T-Tung
#=======================fred API===========================================
# 非農就業人口 (Nonfarm Payroll Employment, NFP, PAYEMS)
#==========================================================================

laber.date <- ("2020-01-01")


# 非農就業人口 (Nonfarm Payroll Employment, NFP, PAYEMS)
Nonfarm <-fredr_series_observations(series_id = "PAYEMS") %>%
  mutate(Nonfarm = c(NA, diff(value) %>% round())) %>%
  filter(date >= laber.date) %>%
  select(-series_id, -value)

# ADP Total Nonfarm Private Payroll Employment (NPPTTL)
ADP <-fredr_series_observations(series_id = "NPPTTL") %>%
  mutate(ADP = c(NA, diff(value) %>% round())) %>%
  filter(date >= laber.date) %>%
  select(-series_id, -value)

#=======================私部門 (private)=====================================
# 私部門 (private, USPRIV)
Private <-fredr_series_observations(series_id = "USPRIV") %>%
  mutate(Private = c(NA, diff(value) %>% round())) %>%
  filter(date >= laber.date) %>%
  select(-series_id, -value)

#=======================商品生產 (Goods-producing)========================
# 商品生產 (Goods.producing, USGOOD)
Goods.producing <-fredr_series_observations(series_id = "USGOOD") %>%
  mutate(Goods.producing = c(NA, diff(value) %>% round())) %>%
  filter(date >= laber.date) %>%
  select(-series_id, -value)

    # 礦業、筏木 (Mining and logging, USMINE)
    Mining.logging <-fredr_series_observations(series_id = "USMINE") %>%
      mutate(Mining.logging = c(NA, diff(value) %>% round())) %>%
      filter(date >= laber.date) %>%
      select(-series_id, -value)

    # 營建 (Construction, USCONS)
    Construction <-fredr_series_observations(series_id = "USCONS") %>%
      mutate(Construction = c(NA, diff(value) %>% round())) %>%
      filter(date >= laber.date) %>%
      select(-series_id, -value)

    # 製造 (Manufacturing, MANEMP)
    Manufacturing <-fredr_series_observations(series_id = "MANEMP") %>%
      mutate(Manufacturing = c(NA, diff(value) %>% round())) %>%
      filter(date >= laber.date) %>%
      select(-series_id, -value)



#==================提供服務 (Private service-providing)====================
# 提供服務 (Private service-providing, SRVPRD)
Private.service.providing <-fredr_series_observations(series_id = "SRVPRD") %>%
  mutate(service.providing = c(NA, diff(value) %>% round())) %>%
  filter(date >= laber.date) %>%
  select(-series_id, -value)

    #==================貿易、運輸、公用事業====================
    # 貿易、運輸、公用事業 (Trade, transportation, and utilities, USTPU)
    Trade.transportation.utilities <-fredr_series_observations(series_id = "USTPU") %>%
      mutate(Trade.transportation.utilities = c(NA, diff(value) %>% round())) %>%
      filter(date >= laber.date) %>%
      select(-series_id, -value)

        # 批發 (Wholesale trade, USWTRADE)
        Wholesale <-fredr_series_observations(series_id = "USWTRADE") %>%
          mutate(Wholesale = c(NA, diff(value) %>% round())) %>%
          filter(date >= laber.date) %>%
          select(-series_id, -value)

        # 零售 (Retail trade, USTRADE)
        Retail <-fredr_series_observations(series_id = "USTRADE") %>%
          mutate(Retail = c(NA, diff(value) %>% round())) %>%
          filter(date >= laber.date) %>%
          select(-series_id, -value)
      #==================貿易、運輸、公用事業====================


    # 資訊 (Information, USINFO)
    Information <-fredr_series_observations(series_id = "USINFO") %>%
      mutate(Information = c(NA, diff(value) %>% round())) %>%
      filter(date >= laber.date) %>%
      select(-series_id, -value)

    # 金融 (Financial activities, USFIRE)
    Financial <-fredr_series_observations(series_id = "USFIRE") %>%
      mutate(Financial = c(NA, diff(value) %>% round())) %>%
      filter(date >= laber.date) %>%
      select(-series_id, -value)

    # 專業商業服務 (Professional and business services, USPBS)
    Professional <-fredr_series_observations(series_id = "USPBS") %>%
      mutate(Professional = c(NA, diff(value) %>% round())) %>%
      filter(date >= laber.date) %>%
      select(-series_id, -value)

    # 教育健康 (Education and health services, USEHS)
    Education <-fredr_series_observations(series_id = "USEHS") %>%
      mutate(Education = c(NA, diff(value) %>% round())) %>%
      filter(date >= laber.date) %>%
      select(-series_id, -value)

    # 娛樂 (Leisure and hospitality, USLAH)
    Leisure <-fredr_series_observations(series_id = "USLAH") %>%
      mutate(Leisure = c(NA, diff(value) %>% round())) %>%
      filter(date >= laber.date) %>%
      select(-series_id, -value)

    # 其他 (Other services, USSERV)
    Other <-fredr_series_observations(series_id = "USSERV") %>%
      mutate(Other = c(NA, diff(value) %>% round())) %>%
      filter(date >= laber.date) %>%
      select(-series_id, -value)

#=======================公部門 (Government)=====================================
# 公部門 (Government, USGOVT)
Government <-fredr_series_observations(series_id = "USGOVT") %>%
  mutate(Government = c(NA, diff(value) %>% round())) %>%
  filter(date >= laber.date) %>%
  select(-series_id, -value)




labor <- full_join(Nonfarm, ADP, by = "date") %>%
  full_join(Private, by = "date") %>%
  full_join(Goods.producing, by = "date") %>%
  full_join(Mining.logging, by = "date") %>%
  full_join(Construction, by = "date") %>%
  full_join(Manufacturing, by = "date") %>%
  full_join(Private.service.providing, by = "date") %>%
  full_join(Trade.transportation.utilities, by = "date") %>%
  full_join(Wholesale, by = "date") %>%
  full_join(Retail, by = "date") %>%
  full_join(Information, by = "date") %>%
  full_join(Financial, by = "date") %>%
  full_join(Professional, by = "date") %>%
  full_join(Education, by = "date") %>%
  full_join(Leisure, by = "date") %>%
  full_join(Other, by = "date") %>%
  full_join(Government, by = "date")

labor.ts <- xts(labor[,-1], as.Date(labor$date))


highchart(type = "stock") %>%
  hc_title(text = list(str_c("TX 2009 - 2020 年近遠月價差分佈圖"))) %>%
  hc_subtitle(text = list("Source: Source: TAIFEX Database")) %>%
  hc_add_series(labor.ts$Nonfarm, yAxis = 0, name = "Nonfarm") %>%
  hc_add_series(labor.ts$Private, yAxis = 0, name = "Private") %>%
  hc_add_series(labor.ts$Goods.producing, yAxis = 0, name = "Goods.producing") %>%
  hc_add_series(labor.ts$service.providing, yAxis = 0, name = "service.providing") %>%
  hc_add_series(labor.ts$Trade.transportation.utilities, yAxis = 0, name = "Trade.transportation.utilities") %>%
  hc_add_series(labor.ts$Wholesale, yAxis = 0, name = "Wholesale") %>%
  hc_add_series(labor.ts$Retail, yAxis = 0, name = "Retail") %>%
  hc_add_series(labor.ts$Financial, yAxis = 0, name = "Financial") %>%
  hc_add_series(labor.ts$Professional, yAxis = 0, name = "Professional") %>%
  hc_add_series(labor.ts$Leisure, yAxis = 0, name = "Leisure") %>%
  hc_add_series(labor.ts$Government, yAxis = 0, name = "Government") %>%
  hc_tooltip(crosshairs = TRUE) %>%
  hc_add_theme(hc_theme_gridlight())


highchart() %>%
  hc_title(text = list(str_c("TX 2009 - 2020 年近遠月價差分佈圖"))) %>%
  hc_subtitle(text = list("Source: Source: TAIFEX Database")) %>%
  hc_xAxis(categories = labor$date) %>%
  hc_add_series(labor$Nonfarm, yAxis = 0, name = "Nonfarm") %>%
  hc_add_series(labor$Private, yAxis = 0, name = "Private") %>%
  hc_add_series(labor$Goods.producing, yAxis = 0, name = "Goods.producing") %>%
  hc_add_series(labor$service.providing, yAxis = 0, name = "service.providing") %>%
  hc_add_series(labor$Trade.transportation.utilities, yAxis = 0, name = "Trade.transportation.utilities") %>%
  hc_add_series(labor$Government, yAxis = 0, name = "Government") %>%
  hc_tooltip(crosshairs = TRUE) %>%
  hc_add_theme(hc_theme_google())

DT::datatable(labor,
              caption = 'Table 2: 價差資料',
              filter = 'top',
              extensions = 'Buttons', options = list(
                dom = 'Blfrtip',
                buttons = list(list(extend = 'colvis', columns = c(1:19)))
              )
)



#=======================fred API===========================================
# 失業人口數據 Unemployment Rate (UNRATE)
#==========================================================================
# Unemployment Rate (UNRATE)
Unemployment <-fredr_series_observations(series_id = "UNRATE") %>%
  filter(date >= laber.date) %>%
  rename(UNRATE = value) %>%
  select(-series_id)


# Initial Claims (ICSA)
Initial.Claims <-fredr_series_observations(series_id = "ICSA") %>%
  filter(date > "2020-02-01") %>%
  rename(Initial.Claims = value) %>%
  select(-series_id)

# Continued Claims (Insured Unemployment) (CCSA)
Continued.Claims <-fredr_series_observations(series_id = "CCSA") %>%
  filter(date > "2020-02-01") %>%
  rename(Continued.Claims = value) %>%
  select(-series_id)



labor <- full_join(Nonfarm, ADP, by = "date") %>%
  full_join(Unemployment, by = "date")

Claims <- full_join(Initial.Claims, Continued.Claims, by = "date")



### 有多個sheet要寫入檔案，或是要調整sheet的style
wb <- createWorkbook()
# 增加sheet
addWorksheet(wb, "Unemployment")
addWorksheet(wb, "Claims")
# 寫檔
writeData(wb, sheet = "Unemployment", labor)
writeData(wb, sheet = "Claims", Claims)

# 存檔
saveWorkbook(wb, "US.labor.xlsx", overwrite = TRUE)


#==================================================================================
# 消費數據
#=======================找出有開盤的日期===========================================


retail.date <- ("2020-01-01")

# Advance Retail Sales: Retail and Food Services, Total (RSAFS)
# 計算零售銷售年增率(YOY)
retail <-fredr_series_observations(series_id = "RSAFS") %>%
  group_by( month(date)) %>%
  mutate(retail.YOY = value/lag(value)-1)%>%
  ungroup() %>%
  na.omit()  %>%
  select(date, retail.YOY) %>%
  filter(date >= retail.date)


# Advance Retail Sales: Retail (Excluding Food Services) (RSXFS)
# 計算零售銷售年增率(YOY) -- 不含食物
retail.XF <-fredr_series_observations(series_id = "RSXFS") %>%
  group_by( month(date)) %>%
  mutate(retail.XF.YOY = value/lag(value)-1)%>%
  ungroup() %>%
  na.omit()  %>%
  select(date, retail.XF.YOY) %>%
  filter(date >= retail.date)

retail <- full_join(retail, retail.XF, by = "date")
# 存檔
write.xlsx(retail, file = "US.retail.xlsx",
           sheetName = "retail", append = FALSE)


#==================================================================================
# 耐久財
#=======================找出有開盤的日期===========================================

Durable.Goods.date <- ("2010-01-01")

# Manufacturers' New Orders: Durable Goods (DGORDER)
# 耐久財訂單總額
Durable.Goods <-fredr_series_observations(series_id = "DGORDER") %>%
  filter(date >= Durable.Goods.date) %>%
  rename(Durable.Goods = value) %>%
  select(-series_id)

# 存檔
write.xlsx(Durable.Goods, file = "Durable.Goods.xlsx",
           sheetName = "Durable.Goods", append = FALSE)
