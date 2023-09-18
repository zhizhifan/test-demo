library(tidyverse)
library(lubridate)
library(scales)
library(ggpubr)
library(showtext)
library(patchwork)
library(zoo)

font_path <- "C:/USERS/LENOVO/APPDATA/LOCAL/MICROSOFT/WINDOWS/FONTS/MISANS-NORMAL.TTF"
font_add("misans", font_path)
showtext_auto()

date <- as.Date.ts(AirPassengers)

l_AirPassengers <- log(AirPassengers)

raw <- data.frame(
  num = as.numeric(AirPassengers),
  date = date
) 

trans <- data.frame(
  num = as.numeric(l_AirPassengers),
  date = date
) 


p1 <- ggplot(raw)+
  geom_line(aes(x = date, y = num), linewidth = 1)+
  scale_x_date(
    date_breaks = "1 year",
    date_labels = "%Y"
  )+
  theme_pubr()+
  theme(
    panel.grid.major = element_line(),
    text = element_text(family = "misans"),
    axis.title = element_blank()
  )

p2 <- ggplot(trans)+
  geom_line(aes(x = date, y = num), color = "red", linewidth = 1)+
  scale_x_date(
    date_breaks = "1 year",
    date_labels = "%Y"
  )+
  theme_pubr()+
  theme(
    panel.grid.major = element_line(),
    text = element_text(family = "misans"),
    axis.title = element_blank()
  )

p1/p2